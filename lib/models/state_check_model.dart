// lib/models/state_check_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_check_model.freezed.dart';
part 'state_check_model.g.dart';

/// 사용자의 상태체크 기록을 저장하는 모델
@freezed
class StateCheckModel with _$StateCheckModel {
  const factory StateCheckModel({
    /// 유니크 아이디 (UUID)
    required String id,
    
    /// 생성일시 (체크한 시간)
    required DateTime createdAt,
    
    /// 생성자 아이디
    @JsonKey(name: 'user_id') String? userId,
    
    /// 생성자 닉네임
    @JsonKey(name: 'user_nickname') String? userNickname,
    
    /// 체크한 상태 구분 (예: 통증, 식사, 투약 등)
    required String state,
    
    /// 체크한 상태 구체적 내용
    @Default('') String content,
    
    /// 추가 작성된 메모 내용
    @Default('') String note,
  }) = _StateCheckModel;

  factory StateCheckModel.fromJson(Map<String, dynamic> json) => _$StateCheckModelFromJson(json);
}
