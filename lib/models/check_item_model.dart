// lib/models/check_item_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_item_model.freezed.dart';
part 'check_item_model.g.dart';

/// 사용자가 간편한 상태체크를 위해 등록하는 기준 항목 모델
@freezed
class CheckItemModel with _$CheckItemModel {
  const factory CheckItemModel({
    /// 유니크 아이디 (UUID)
    required String id,
    
    /// 생성일시
    required DateTime createdAt,
    
    /// 생성자 아이디
    @JsonKey(name: 'user_id') String? userId,
    
    /// 생성자 닉네임
    @JsonKey(name: 'user_nickname') String? userNickname,
    
    /// 상태 타입 (예: PAIN_CHECK, MEDICATION_CHECK 등)
    required String type,
    
    /// 상세 입력 항목 리스트
    @JsonKey(name: 'item') @Default([]) List<String> items,
    
    /// 추가 작성된 메모 내용
    @Default('') String note,
  }) = _CheckItemModel;

  factory CheckItemModel.fromJson(Map<String, dynamic> json) => _$CheckItemModelFromJson(json);
}
