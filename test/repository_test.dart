// test/repository_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:senior_check_state/models/state_check_model.dart';
import 'package:senior_check_state/core/repositories/mock_state_check_repository.dart';

void main() {
  group('MockStateCheckRepository 단위 테스트', () {
    late MockStateCheckRepository repository;

    setUp(() {
      SharedPreferences.setMockInitialValues({}); // shared_preferences 초기화
      repository = MockStateCheckRepository();
    });

    test('초기 상태에서는 빈 리스트를 반환해야 함', () async {
      final records = await repository.getRecords();
      expect(records, isEmpty);
    });

    test('기록 저장 및 조회 테스트', () async {
      final record = StateCheckModel(
        id: 'test-1',
        createdAt: DateTime.now(),
        state: '투약',
        content: '혈압약 복용 완료',
      );

      await repository.saveRecord(record);
      final records = await repository.getRecords();
      
      expect(records.length, 1);
      expect(records.first.id, 'test-1');
      expect(records.first.content, '혈압약 복용 완료');
    });

    test('기록 수정 테스트', () async {
      final record = StateCheckModel(
        id: 'test-2',
        createdAt: DateTime.now(),
        state: '식사',
        content: '아침 식사 전',
      );

      await repository.saveRecord(record);
      
      final updatedRecord = record.copyWith(content: '아침 식사 완료');
      await repository.updateRecord(updatedRecord);
      
      final records = await repository.getRecords();
      expect(records.first.content, '아침 식사 완료');
    });

    test('기록 삭제 테스트', () async {
      final record = StateCheckModel(
        id: 'test-3',
        createdAt: DateTime.now(),
        state: '운동',
      );

      await repository.saveRecord(record);
      await repository.deleteRecord('test-3');
      
      final records = await repository.getRecords();
      expect(records, isEmpty);
    });
  });
}
