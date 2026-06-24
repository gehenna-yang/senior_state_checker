// lib/core/repositories/mock_state_check_repository.dart

import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/state_check_model.dart';
import 'state_check_repository.dart';

part 'mock_state_check_repository.g.dart';

/// [shared_preferences]를 사용하여 데이터를 로컬에 영속적으로 저장하는 Mock 리포지토리입니다.
/// 코딩 가이드 1번(Mock Backend Rules) 규칙을 준수하여 500ms의 지연시간을 포함합니다.
class MockStateCheckRepository implements AbstractStateCheckRepository {
  static const String _storageKey = 'mock_state_check_records';

  @override
  Future<List<StateCheckModel>> getRecords() async {
    // 실제 서버 통신 느낌을 주기 위한 지연시간
    await Future.delayed(const Duration(milliseconds: 500));

    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_storageKey);

    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    try {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList
          .map((json) => StateCheckModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // 데이터가 깨진 경우 안전하게 빈 리스트 반환
      return [];
    }
  }

  @override
  Future<void> saveRecord(StateCheckModel record) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final currentRecords = await getRecords();
    currentRecords.add(record);
    
    await _saveToLocal(currentRecords);
  }

  @override
  Future<void> updateRecord(StateCheckModel record) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final currentRecords = await getRecords();
    final index = currentRecords.indexWhere((e) => e.id == record.id);

    if (index != -1) {
      currentRecords[index] = record;
      await _saveToLocal(currentRecords);
    }
  }

  @override
  Future<void> deleteRecord(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final currentRecords = await getRecords();
    currentRecords.removeWhere((e) => e.id == id);

    await _saveToLocal(currentRecords);
  }

  /// 내부 유틸리티: 리스트를 JSON 문자열로 변환하여 저장
  Future<void> _saveToLocal(List<StateCheckModel> records) async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(records.map((e) => e.toJson()).toList());
    await prefs.setString(_storageKey, encoded);
  }
}

/// 리포지토리 구현체를 제공하는 Riverpod 프로바이더
/// 앱 전체에서 `ref.watch(stateCheckRepositoryProvider)`를 통해 접근할 수 있습니다.
@riverpod
AbstractStateCheckRepository stateCheckRepository(StateCheckRepositoryRef ref) {
  return MockStateCheckRepository();
}
