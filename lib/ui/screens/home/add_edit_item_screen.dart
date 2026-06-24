// lib/ui/screens/home/add_edit_item_screen.dart (CheckItemManagementScreen으로 활용)

import 'package:flutter/material.dart';

class AddEditItemScreen extends StatelessWidget {
  const AddEditItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('나의 체크 항목 관리', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _itemTile('혈압약 복용', '매일 아침 8시', Icons.medication, Colors.blue),
          _itemTile('아침 식사', '매일 아침 7시 30분', Icons.restaurant, Colors.green),
          _itemTile('공원 산책', '매일 오전 10시', Icons.directions_run, Colors.orange),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('새 항목 추가하기'),
          ),
        ],
      ),
    );
  }

  Widget _itemTile(String title, String time, IconData icon, Color color) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: color, size: 32),
        title: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Text(time, style: const TextStyle(fontSize: 16)),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.grey),
          onPressed: () {},
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      ),
    );
  }
}
