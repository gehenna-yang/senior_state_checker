import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/check_item.dart';
import '../../data/repositories/mock_check_repository.dart';

part 'search_view_model.freezed.dart';
part 'search_view_model.g.dart';

@freezed
class HealthStats with _$HealthStats {
  const factory HealthStats({
    required double medicationRate,
    required double mealRate,
    required double exerciseRate,
    required double totalDistance,
    required int totalExerciseMinutes,
  }) = _HealthStats;
}

@riverpod
class SearchViewModel extends _$SearchViewModel {
  @override
  FutureOr<HealthStats> build() async {
    final items = await ref.watch(checkRepositoryProvider).getCheckItems(DateTime.now());
    
    int medTotal = 0, medDone = 0;
    int mealTotal = 0, mealDone = 0;
    int exeTotal = 0, exeDone = 0;
    double distance = 0.0;
    int minutes = 0;

    for (var item in items) {
      switch (item.type) {
        case CheckType.medication:
          medTotal++;
          if (item.isCompleted) medDone++;
          break;
        case CheckType.meal:
          mealTotal++;
          if (item.isCompleted) mealDone++;
          break;
        case CheckType.exercise:
          exeTotal++;
          if (item.isCompleted) exeDone++;
          distance += item.distance;
          if (item.startedTime != null && item.completedTime != null) {
            minutes += item.completedTime!.difference(item.startedTime!).inMinutes;
          }
          break;
      }
    }

    return HealthStats(
      medicationRate: medTotal > 0 ? medDone / medTotal : 0,
      mealRate: mealTotal > 0 ? mealDone / mealTotal : 0,
      exerciseRate: exeTotal > 0 ? exeDone / exeTotal : 0,
      totalDistance: distance,
      totalExerciseMinutes: minutes,
    );
  }
}
