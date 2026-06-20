import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/check_item.dart';
import '../../data/repositories/mock_check_repository.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  FutureOr<List<CheckItem>> build() async {
    return _fetchItems();
  }

  Future<List<CheckItem>> _fetchItems() async {
    final repository = ref.read(checkRepositoryProvider);
    return repository.getCheckItems(DateTime.now());
  }

  Future<void> toggleStatus(String id, bool currentStatus) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(checkRepositoryProvider);
      await repository.toggleCheckStatus(id, !currentStatus);
      return _fetchItems();
    });
  }

  // 운동 시작 로직
  Future<void> startExercise(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(checkRepositoryProvider);
      final items = await repository.getCheckItems(DateTime.now());
      final item = items.firstWhere((e) => e.id == id);
      
      await repository.updateCheckItem(item.copyWith(
        startedTime: DateTime.now(),
        isCompleted: false,
      ));
      return _fetchItems();
    });
  }

  // 운동 종료 로직
  Future<void> stopExercise(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(checkRepositoryProvider);
      final items = await repository.getCheckItems(DateTime.now());
      final item = items.firstWhere((e) => e.id == id);
      
      final endTime = DateTime.now();
      double calculatedDistance = 0.0;
      
      if (item.startedTime != null) {
        // 실제 GPS 대신 시간 대비 가상 거리 계산 (분당 0.05km 가정)
        final minutes = endTime.difference(item.startedTime!).inMinutes;
        calculatedDistance = minutes * 0.05;
      }

      await repository.updateCheckItem(item.copyWith(
        completedTime: endTime,
        isCompleted: true,
        distance: calculatedDistance,
      ));
      return _fetchItems();
    });
  }

  // 음성 명령 처리 로직
  Future<String?> handleVoiceCommand(String text) async {
    final items = state.valueOrNull;
    if (items == null) return '항목을 불러오는 중입니다.';

    String? targetId;
    String? message;

    if (text.contains('약')) {
      targetId = items.firstWhere((e) => e.type == CheckType.medication).id;
      message = '약 복용 상태를 완료로 변경합니다.';
    } else if (text.contains('식사') || text.contains('밥')) {
      targetId = items.firstWhere((e) => e.type == CheckType.meal).id;
      message = '식사 상태를 완료로 변경합니다.';
    } else if (text.contains('운동') || text.contains('산책')) {
      final exerciseItem = items.firstWhere((e) => e.type == CheckType.exercise);
      targetId = exerciseItem.id;
      
      if (text.contains('시작')) {
        await startExercise(targetId);
        return '운동을 시작합니다. 화이팅!';
      } else if (text.contains('종료') || text.contains('끝') || text.contains('했어')) {
        await stopExercise(targetId);
        return '운동을 완료하셨습니다. 수고하셨어요!';
      }
      message = '운동 상태를 변경합니다.';
    }

    if (targetId != null) {
      await toggleStatus(targetId, false);
      return message;
    }

    return '인식된 명령이 없습니다: "$text"';
  }
}

@riverpod
class ListeningState extends _$ListeningState {
  @override
  bool build() => false;

  void setListening(bool value) => state = value;
}
