// lib/ui/screens/search/search_screen.dart (HistoryScreen으로 활용)

import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: index % 2 == 0 ? Colors.blue[100] : Colors.green[100],
              child: Icon(index % 2 == 0 ? Icons.medication : Icons.restaurant, color: Colors.blue),
            ),
            title: Text('6월 ${20 - index}일 기록', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle: const Text('투약 완료, 아침 식사 완료', style: TextStyle(fontSize: 16)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        );
      },
    );
  }
}
