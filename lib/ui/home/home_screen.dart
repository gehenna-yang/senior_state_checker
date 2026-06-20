import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'home_view_model.dart';
import '../../domain/entities/check_item.dart';
import '../../core/services/voice_service.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);
    final isListening = ref.watch(listeningStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('오늘의 상태 체크', 
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: homeState.when(
        data: (items) => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _CheckItemCard(item: item);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('에러 발생: $err')),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              final voiceService = ref.read(voiceServiceProvider.notifier);
              await voiceService.startListening(
                onResult: (text) async {
                  final message = await ref.read(homeViewModelProvider.notifier).handleVoiceCommand(text);
                  if (context.mounted && message != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message, style: const TextStyle(fontSize: 18))),
                    );
                  }
                },
                onListeningStateChanged: (listening) {
                  ref.read(listeningStateProvider.notifier).setListening(listening);
                },
              );
            },
            backgroundColor: isListening ? Colors.red : Colors.deepPurple,
            child: Icon(isListening ? Icons.mic : Icons.mic_none),
          ),
          const SizedBox(height: 16),
          FloatingActionButton.extended(
            onPressed: () => context.go('/add-item'),
            label: const Text('항목 추가', style: TextStyle(fontSize: 18)),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class _CheckItemCard extends ConsumerWidget {
  final CheckItem item;
  const _CheckItemCard({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = _getTypeColor(item.type);
    final timeStr = item.scheduledTime != null 
        ? DateFormat('HH:mm').format(item.scheduledTime!) 
        : '';

    return InkWell(
      onTap: () => context.go('/edit-item/${item.id}'),
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          leading: CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(_getTypeIcon(item.type), color: color),
          ),
          title: Text(
            item.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: item.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.description != null) Text(item.description!, style: const TextStyle(fontSize: 16)),
              Text('예정 시간: $timeStr', style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          trailing: Checkbox(
            value: item.isCompleted,
            onChanged: (value) {
              ref.read(homeViewModelProvider.notifier).toggleStatus(item.id, item.isCompleted);
            },
            activeColor: color,
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(CheckType type) {
    switch (type) {
      case CheckType.medication: return Colors.orange;
      case CheckType.meal: return Colors.green;
      case CheckType.exercise: return Colors.blue;
    }
  }

  IconData _getTypeIcon(CheckType type) {
    switch (type) {
      case CheckType.medication: return Icons.medication;
      case CheckType.meal: return Icons.restaurant;
      case CheckType.exercise: return Icons.directions_run;
    }
  }
}
