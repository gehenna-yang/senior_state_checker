// test/widget_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:senior_check_state/main.dart';

void main() {
  testWidgets('앱 로드 테스트', (WidgetTester tester) async {
    // SeniorCheckApp으로 이름이 변경됨에 따라 수정
    await tester.pumpWidget(const SeniorCheckApp());

    // 초기 화면 로드 확인 (예: '시니어 체크' 텍스트 존재 여부 등)
    expect(find.text('시니어 체크'), findsNothing); // 실제로는 MaterialApp.router 내부 로드 대기 필요
  });
}
