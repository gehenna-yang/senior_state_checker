import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/check_item.dart';
import 'home_view_model.dart';
import '../../data/repositories/mock_check_repository.dart';

class AddEditItemScreen extends ConsumerStatefulWidget {
  final String? itemId;

  const AddEditItemScreen({super.key, this.itemId});

  @override
  ConsumerState<AddEditItemScreen> createState() => _AddEditItemScreenState();
}

class _AddEditItemScreenState extends ConsumerState<AddEditItemScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late CheckType _selectedType;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _selectedType = CheckType.medication;
    _selectedTime = TimeOfDay.now();

    if (widget.itemId != null) {
      _loadItemData();
    }
  }

  void _loadItemData() {
    final homeState = ref.read(homeViewModelProvider);
    homeState.whenData((items) {
      try {
        final item = items.firstWhere((e) => e.id == widget.itemId);
        _titleController.text = item.title;
        _descriptionController.text = item.description ?? '';
        _selectedType = item.type;
        if (item.scheduledTime != null) {
          _selectedTime = TimeOfDay.fromDateTime(item.scheduledTime!);
        }
      } catch (e) {
        // 항목을 찾을 수 없는 경우 처리
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      final now = DateTime.now();
      final scheduledDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );

      final repository = ref.read(checkRepositoryProvider);
      
      if (widget.itemId == null) {
        // 추가
        final newItem = CheckItem(
          id: const Uuid().v4(),
          title: _titleController.text,
          description: _descriptionController.text.isEmpty ? null : _descriptionController.text,
          type: _selectedType,
          scheduledTime: scheduledDateTime,
        );
        await repository.addCheckItem(newItem);
      } else {
        // 수정
        final homeState = ref.read(homeViewModelProvider);
        homeState.whenData((items) async {
          final existingItem = items.firstWhere((e) => e.id == widget.itemId);
          final updatedItem = existingItem.copyWith(
            title: _titleController.text,
            description: _descriptionController.text.isEmpty ? null : _descriptionController.text,
            type: _selectedType,
            scheduledTime: scheduledDateTime,
          );
          await repository.updateCheckItem(updatedItem);
        });
      }

      // 목록 새로고침 및 뒤로 가기
      ref.invalidate(homeViewModelProvider);
      if (mounted) {
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemId == null ? '항목 추가' : '항목 수정',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('무엇을 체크할까요?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: '예: 혈압약 복용, 점심 식사',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) => (value == null || value.isEmpty) ? '제목을 입력해주세요' : null,
              ),
              const SizedBox(height: 24),
              const Text('어떤 종류인가요?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: CheckType.values.map((type) {
                  final isSelected = _selectedType == type;
                  return InkWell(
                    onTap: () => setState(() => _selectedType = type),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.28,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: isSelected ? _getTypeColor(type) : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            _getTypeIcon(type),
                            color: isSelected ? Colors.white : Colors.grey,
                            size: 30,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _getTypeName(type),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              const Text('언제 알림을 드릴까요?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              InkWell(
                onTap: _selectTime,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedTime.format(context),
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.access_time, size: 30),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text('추가 설명 (선택)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: '추가로 메모할 내용이 있다면 입력해주세요',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _saveItem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 64),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(widget.itemId == null ? '등록하기' : '수정 완료', 
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTypeName(CheckType type) {
    switch (type) {
      case CheckType.medication: return '투약';
      case CheckType.meal: return '식사';
      case CheckType.exercise: return '운동';
    }
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
