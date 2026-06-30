// lib/core/repositories/check_item_repository.dart

import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/check_item_model.dart';

part 'check_item_repository.g.dart';

/// 체크해야 할 기준 항목(약, 식사 등)을 관리하는 추상 리포지토리
abstract class AbstractCheckItemRepository {
  Future<List<CheckItemModel>> getCheckItems();
  Future<void> saveCheckItem(CheckItemModel item);
}

/// [shared_preferences]를 사용하여 체크 항목 리스트를 관리하는 Mock 구현체
class MockCheckItemRepository implements AbstractCheckItemRepository {
  static const String _storageKey = 'check_item_masters';

  @override
  Future<List<CheckItemModel>> getCheckItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_storageKey);

    if (jsonString == null || jsonString.isEmpty) {
      // 초기 기본 데이터 제공 (시니어 사용자 테스트용)
      return [
        CheckItemModel(
          id: 'master-1',
          createdAt: DateTime.now(),
          type: '혈압약',
          items: ['a 알약 한알', 'b 알약 한알'],
          note: '아침 식사 후 복용',
        ),
        CheckItemModel(
          id: 'master-2',
          createdAt: DateTime.now(),
          type: '점심밥',
          items: ['김치', '밥', '소고기', '콩나물국'],
        ),
      ];
    }

    try {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList
          .map((json) => CheckItemModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> saveCheckItem(CheckItemModel item) async {
    final items = await getCheckItems();
    items.add(item);
    
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(items.map((e) => e.toJson()).toList());
    await prefs.setString(_storageKey, encoded);
  }
}

@riverpod
AbstractCheckItemRepository checkItemRepository(CheckItemRepositoryRef ref) {
  return MockCheckItemRepository();
}
