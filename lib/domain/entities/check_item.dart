import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_item.freezed.dart';
part 'check_item.g.dart';

enum CheckType {
  medication, // 투약
  meal,       // 식사
  exercise,   // 운동
}

@freezed
class CheckItem with _$CheckItem {
  const factory CheckItem({
    required String id,
    required String title,
    required CheckType type,
    String? description,
    @Default(false) bool isCompleted,
    DateTime? scheduledTime,
    DateTime? startedTime,      // 운동 시작 시간
    DateTime? completedTime,    // 완료 시간
    @Default(0.0) double distance, // 이동 거리 (km)
    String? memo,
    List<String>? imageUrls,
  }) = _CheckItem;

  factory CheckItem.fromJson(Map<String, dynamic> json) => _$CheckItemFromJson(json);
}
