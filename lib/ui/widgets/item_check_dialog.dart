// lib/ui/widgets/item_check_dialog.dart

import 'package:flutter/material.dart';

/// 음성 인식 결과 일치하는 항목이 없을 때 표시되는 안내 다이얼로그
class ItemCheckDialog extends StatelessWidget {
  final String recognizedText;

  const ItemCheckDialog({super.key, required this.recognizedText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Row(
        children: [
          Icon(Icons.help_outline, color: Colors.orange, size: 36),
          SizedBox(width: 12),
          Text('항목을 찾을 수 없어요', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '말씀하신 내용과 일치하는 건강 관리 항목이 리스트에 없습니다.',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '"$recognizedText"',
              style: const TextStyle(fontSize: 22, fontStyle: FontStyle.italic, color: Colors.blueGrey),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '약 이름이나 식사 명칭이 올바르게 등록되어 있는지 확인해 주세요.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('확인', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
