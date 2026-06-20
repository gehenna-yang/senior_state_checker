import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/check_item.dart';
import '../../domain/repositories/check_repository.dart';

part 'mock_check_repository.g.dart';

class MockCheckRepository implements CheckRepository {
  final List<CheckItem> _items = [
    CheckItem(
      id: '1',
      title: '혈압약 복용',
      type: CheckType.medication,
      description: '아침 식사 후 30분',
      scheduledTime: DateTime.now().copyWith(hour: 8, minute: 0),
    ),
    CheckItem(
      id: '2',
      title: '아침 식사',
      type: CheckType.meal,
      scheduledTime: DateTime.now().copyWith(hour: 7, minute: 30),
    ),
    CheckItem(
      id: '3',
      title: '공원 산책',
      type: CheckType.exercise,
      description: '30분 이상 걷기',
      scheduledTime: DateTime.now().copyWith(hour: 10, minute: 0),
    ),
  ];

  @override
  Future<List<CheckItem>> getCheckItems(DateTime date) async {
    // 실제로는 날짜 필터링 로직이 필요하지만 Mock이므로 전체 반환
    return _items;
  }

  @override
  Future<void> addCheckItem(CheckItem item) async {
    _items.add(item);
  }

  @override
  Future<void> updateCheckItem(CheckItem item) async {
    final index = _items.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      _items[index] = item;
    }
  }

  @override
  Future<void> deleteCheckItem(String id) async {
    _items.removeWhere((e) => e.id == id);
  }

  @override
  Future<void> toggleCheckStatus(String id, bool isCompleted) async {
    final index = _items.indexWhere((e) => e.id == id);
    if (index != -1) {
      _items[index] = _items[index].copyWith(
        isCompleted: isCompleted,
        completedTime: isCompleted ? DateTime.now() : null,
      );
    }
  }
}

@riverpod
CheckRepository checkRepository(CheckRepositoryRef ref) {
  return MockCheckRepository();
}
