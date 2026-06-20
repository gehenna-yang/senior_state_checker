import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'profile_view_model.dart';
import '../../domain/entities/guardian.dart';
import '../../core/providers/settings_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('보호자 관리 및 설정', 
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ProfileHeader(),
            const SizedBox(height: 24),
            const Text(
              '내 정보를 공유받는 보호자',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            profileState.when(
              data: (guardians) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: guardians.length,
                itemBuilder: (context, index) {
                  final guardian = guardians[index];
                  return _GuardianCard(guardian: guardian);
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('에러 발생: $err')),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: 보호자 추가 팝업 구현
              },
              icon: const Icon(Icons.person_add),
              label: const Text('새 보호자 등록', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              '앱 설정',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const _SettingsSection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends ConsumerWidget {
  const _SettingsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return Column(
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              ListTile(
                title: const Text('고대비 모드 (크게 보기)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: const Text('화면을 검정 배경으로 바꿔서 글씨를 더 잘 보이게 합니다.'),
                trailing: Switch(
                  value: settings.isHighContrast,
                  onChanged: (_) => notifier.toggleHighContrast(),
                  activeColor: Colors.yellowAccent,
                ),
              ),
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('글자 크기', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: FontScale.values.map((scale) {
                        final isSelected = settings.fontScale == scale;
                        return InkWell(
                          onTap: () => notifier.setFontScale(scale),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.deepPurple : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              scale.label,
                              style: TextStyle(
                                fontSize: 16,
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('김순자 어르신', 
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('오늘도 건강한 하루 되세요!', 
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

class _GuardianCard extends ConsumerWidget {
  final Guardian guardian;
  const _GuardianCard({required this.guardian});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: const CircleAvatar(
          backgroundColor: Colors.blueGrey,
          child: Icon(Icons.family_restroom, color: Colors.white),
        ),
        title: Text(
          '${guardian.name} (${guardian.relationship})',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(guardian.phoneNumber ?? '전화번호 없음'),
        trailing: Switch(
          value: guardian.isSharingEnabled,
          onChanged: (value) {
            ref.read(profileViewModelProvider.notifier).toggleSharing(guardian.id, guardian.isSharingEnabled);
          },
          activeColor: Colors.green,
        ),
      ),
    );
  }
}
