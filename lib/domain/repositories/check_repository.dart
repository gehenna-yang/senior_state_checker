import '../entities/check_item.dart';

abstract class CheckRepository {
  Future<List<CheckItem>> getCheckItems(DateTime date);
  Future<void> addCheckItem(CheckItem item);
  Future<void> updateCheckItem(CheckItem item);
  Future<void> deleteCheckItem(String id);
  Future<void> toggleCheckStatus(String id, bool isCompleted);
}
