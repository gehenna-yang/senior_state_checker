import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/guardian.dart';
import '../../data/repositories/mock_sharing_repository.dart';

part 'profile_view_model.g.dart';

@riverpod
class ProfileViewModel extends _$ProfileViewModel {
  @override
  FutureOr<List<Guardian>> build() async {
    return _fetchGuardians();
  }

  Future<List<Guardian>> _fetchGuardians() async {
    final repository = ref.read(sharingRepositoryProvider);
    return repository.getGuardians();
  }

  Future<void> toggleSharing(String id, bool currentStatus) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(sharingRepositoryProvider);
      await repository.toggleSharing(id, !currentStatus);
      return _fetchGuardians();
    });
  }

  Future<void> removeGuardian(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(sharingRepositoryProvider);
      await repository.removeGuardian(id);
      return _fetchGuardians();
    });
  }
}
