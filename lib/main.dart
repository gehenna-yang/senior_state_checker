// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/config/app_theme.dart';
import 'core/router/app_router.dart';

/// 앱의 진입점
/// 
/// 시니어 Flutter 개발자로서 project_context.md의 아키텍처 규칙을 준수하여 작성되었습니다.
void main() async {
  // Flutter 엔진과 안드로이드/iOS 네이티브 기능(STT, 저장소 등) 연동을 위한 초기화
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // Riverpod 상태 관리를 위한 최상위 ProviderScope 설정
    const ProviderScope(
      child: SeniorCheckApp(),
    ),
  );
}

/// 앱의 최상위 위젯
class SeniorCheckApp extends ConsumerWidget {
  const SeniorCheckApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // lib/core/router/app_router.dart에서 정의한 라우터 프로바이더 구독
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: '시니어 체크',
      
      // 시니어 친화적 테마 적용 (lib/core/config/app_theme.dart)
      theme: AppTheme.seniorTheme,
      
      // GoRouter 기반의 선언적 라우팅 설정
      routerConfig: router,
      
      // 기기 설정에 따른 가독성 유지를 위해 builder에서 통합 관리
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            // 필요 시 전역 폰트 스케일 고정 또는 배율 조정
          ),
          child: child!,
        );
      },
      
      // 디버그 배너 숨김
      debugShowCheckedModeBanner: false,
    );
  }
}
