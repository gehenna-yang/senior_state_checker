import 'package:freezed_annotation/freezed_annotation.dart';

part 'guardian.freezed.dart';
part 'guardian.g.dart';

@freezed
class Guardian with _$Guardian {
  const factory Guardian({
    required String id,
    required String name,
    required String relationship, // 예: 아들, 딸, 배우자
    @Default(true) bool isSharingEnabled,
    String? phoneNumber,
  }) = _Guardian;

  factory Guardian.fromJson(Map<String, dynamic> json) => _$GuardianFromJson(json);
}
