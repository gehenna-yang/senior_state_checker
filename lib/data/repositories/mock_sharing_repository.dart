import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/guardian.dart';
import '../../domain/repositories/sharing_repository.dart';

part 'mock_sharing_repository.g.dart';

class MockSharingRepository implements SharingRepository {
  final List<Guardian> _guardians = [
    const Guardian(
      id: 'g1',
      name: '김철수',
      relationship: '아들',
      isSharingEnabled: true,
      phoneNumber: '010-1234-5678',
    ),
    const Guardian(
      id: 'g2',
      name: '이영희',
      relationship: '딸',
      isSharingEnabled: false,
      phoneNumber: '010-9876-5432',
    ),
  ];

  @override
  Future<List<Guardian>> getGuardians() async {
    return _guardians;
  }

  @override
  Future<void> addGuardian(Guardian guardian) async {
    _guardians.add(guardian);
  }

  @override
  Future<void> removeGuardian(String id) async {
    _guardians.removeWhere((e) => e.id == id);
  }

  @override
  Future<void> toggleSharing(String id, bool isEnabled) async {
    final index = _guardians.indexWhere((e) => e.id == id);
    if (index != -1) {
      _guardians[index] = _guardians[index].copyWith(isSharingEnabled: isEnabled);
    }
  }
}

@riverpod
SharingRepository sharingRepository(SharingRepositoryRef ref) {
  return MockSharingRepository();
}
