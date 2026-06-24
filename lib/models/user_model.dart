// lib/models/user_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// 사용자 정보를 관리하는 모델
/// 어르신과 보호자 정보를 구분하고 로그인 및 상태 기록 시 참조됩니다.
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    /// 유니크 아이디 (UUID)
    required String id,
    
    /// 생성일시
    required DateTime createdAt,
    
    /// 비밀번호 (해싱된 문자열)
    required String password,
    
    /// 사용자 닉네임
    required String nickname,
    
    /// 사용자 직책/역할 (general: 일반 사용자, guardian: 보호자)
    @Default('general') String position,
    
    /// 추가 작성된 메모 내용
    @Default('') String note,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
