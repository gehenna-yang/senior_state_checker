import '../entities/guardian.dart';

abstract class SharingRepository {
  Future<List<Guardian>> getGuardians();
  Future<void> addGuardian(Guardian guardian);
  Future<void> removeGuardian(String id);
  Future<void> toggleSharing(String id, bool isEnabled);
}
