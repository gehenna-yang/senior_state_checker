// lib/ui/screens/profile/profile_screen.dart (SettingsScreen으로 활용)

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('앱 설정 및 관리', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          _settingsCard(
            title: '보이스 모드 사용',
            subtitle: '음성으로 간편하게 기록합니다.',
            trailing: Switch(value: true, onChanged: (v) {}),
          ),
          _settingsCard(
            title: '가족 그룹 설정',
            subtitle: '보호자와 데이터를 공유합니다.',
            onTap: () {},
          ),
          _settingsCard(
            title: '알림 설정',
            subtitle: '투약 및 식사 시간을 알려드립니다.',
            onTap: () {},
          ),
          const SizedBox(height: 40),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
              side: const BorderSide(color: Colors.red),
            ),
            child: const Text('로그아웃', style: TextStyle(color: Colors.red, fontSize: 18)),
          ),
        ],
      ),
    );
  }

  Widget _settingsCard({required String title, required String subtitle, Widget? trailing, VoidCallback? onTap}) {
    return Card(
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 16)),
        trailing: trailing ?? const Icon(Icons.chevron_right, size: 30),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        onTap: onTap,
      ),
    );
  }
}
