// lib/core/repositories/state_check_repository.dart

import '../../models/state_check_model.dart';

/// 어르신의 상태 체크 기록을 관리하기 위한 추상 리포지토리 인터페이스
/// 코딩 가이드 7번(Repository Pattern) 규칙을 준수합니다.
abstract class AbstractStateCheckRepository {
  /// 저장된 모든 상태 체크 기록 목록을 가져옵니다.
  Future<List<StateCheckModel>> getRecords();

  /// 새로운 상태 체크 기록을 저장합니다.
  Future<void> saveRecord(StateCheckModel record);

  /// 기존 상태 체크 기록의 내용을 수정합니다.
  Future<void> updateRecord(StateCheckModel record);

  /// 특정 ID를 가진 기록을 삭제합니다.
  Future<void> deleteRecord(String id);
}
