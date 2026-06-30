// lib/ui/screens/home/home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../state/voice_check_state.dart';
import '../../../core/services/stt_service.dart';
import '../../widgets/mic_wave_animation.dart';
import '../../widgets/item_check_dialog.dart';

/// 앱의 메인 홈 스크린
/// 설정값에 따라 보이스 중심 UI 또는 수동 입력 UI를 렌더링합니다.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final voiceState = ref.watch(voiceCheckNotifierProvider);

    // 설정된 모드에 따라 위젯 교체 (조건부 렌더링)
    return Scaffold(
      body: SafeArea(
        child: voiceState.isVoiceMainMode
            ? const VoiceMainBody()
            : const ManualMainBody(),
      ),
    );
  }
}

/// 1. 보이스 입력 중심의 UI (VoiceMainBody)
class VoiceMainBody extends ConsumerWidget {
  const VoiceMainBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final voiceState = ref.watch(voiceCheckNotifierProvider);
    final notifier = ref.read(voiceCheckNotifierProvider.notifier);
    final sttService = ref.read(sttServiceProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            voiceState.status == VoiceStatus.listening 
              ? '말씀을 듣고 있어요...' 
              : '무엇을 기록할까요?',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          // 인식된 결과나 상태 메시지 표시 (가독성 강화)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              voiceState.recognizedText.isEmpty 
                  ? '예: "혈압약 먹었어"' 
                  : '"${voiceState.recognizedText}"',
              style: const TextStyle(fontSize: 26, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          // 마이크 애니메이션 및 조작부
          GestureDetector(
            onTap: () async {
              if (voiceState.status == VoiceStatus.listening) {
                await sttService.stop();
                notifier.updateStatus(VoiceStatus.idle);
              } else {
                notifier.reset();
                notifier.updateStatus(VoiceStatus.listening);
                await sttService.listen(
                  onResult: (text) async {
                    // Feature 4: 보이스 결과 처리 로직 실행
                    final result = await notifier.processVoiceResult(text);
                    
                    if (!result.isSuccess && context.mounted) {
                      // 일치하는 항목이 없는 경우 다이얼로그 표시
                      showDialog(
                        context: context,
                        builder: (context) => ItemCheckDialog(recognizedText: text),
                      );
                    } else if (result.isSuccess && context.mounted) {
                      // 성공 시 간단한 안내
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${result.matchedItem} 기록을 완료했습니다!', style: const TextStyle(fontSize: 18)),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                  onDone: () async {
                    await sttService.stop();
                    // 성공 처리는 processVoiceResult 내에서 수행됨
                  },
                  onError: (error) => notifier.setError(error),
                );
              }
            },
            child: MicWaveAnimation(
              isListening: voiceState.status == VoiceStatus.listening,
            ),
          ),
          const SizedBox(height: 40),
          // 에러 발생 시 안내 (빨간 글씨로 명확히 표시)
          if (voiceState.errorMessage != null)
            Text(
              voiceState.errorMessage!,
              style: const TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          const Spacer(),
          // 모드 전환 버튼 (시니어를 위해 크고 명확하게)
          ElevatedButton(
            onPressed: () => notifier.toggleVoiceMainMode(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[50],
              foregroundColor: Colors.blue[900],
              elevation: 0,
            ),
            child: const Text('손으로 직접 입력할게요', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

/// 2. 수동 입력 중심의 UI (ManualMainBody)
class ManualMainBody extends ConsumerWidget {
  const ManualMainBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(voiceCheckNotifierProvider.notifier);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '오늘의 체크 리스트',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: const [
                _ManualCheckCard(title: '혈압약 복용', icon: Icons.medication, color: Colors.blue),
                _ManualCheckCard(title: '아침 식사', icon: Icons.restaurant, color: Colors.green),
                _ManualCheckCard(title: '공원 산책', icon: Icons.directions_run, color: Colors.orange),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // 모드 전환 및 보이스 호출 버튼
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => notifier.toggleVoiceMainMode(),
                  icon: const Icon(Icons.mic, size: 28),
                  label: const Text('목소리로 기록하기', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

/// 수동 모드용 개별 항목 카드
class _ManualCheckCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _ManualCheckCard({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        leading: Icon(icon, size: 40, color: color),
        title: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.add_circle_outline, size: 36, color: Colors.grey),
        onTap: () {
          // 상세 기록 로직
        },
      ),
    );
  }
}
