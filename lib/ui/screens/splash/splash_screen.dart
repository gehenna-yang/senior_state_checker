import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:senior_check_state/ui/utils/dprint.dart';
import '../../../core/services/permission_service.dart';

/// 앱 구동 시 가장 먼저 보여지는 스플래시 화면
/// 앱 이름 애니메이션과 기본 셋팅(권한 요청 등)을 처리합니다.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _ConsumerState extends ConsumerState<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    // 1. 앱 이름 애니메이션 설정 (부드러운 페이드 인)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    // 2. 앱 초기화 및 권한 요청 실행
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // 최소 애니메이션 노출을 위해 약간의 지연 추가
    await Future.delayed(const Duration(seconds: 2));

    // 필수 권한 요청 (마이크, 음성 인식)
    final permissionService = ref.read(permissionServiceProvider);
    await permissionService.requestVoicePermissions();

    // 초기화 완료 후 홈 화면으로 이동
    if (mounted) {
      context.go('/');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // 시니어 친화적 연파랑 배경
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.favorite_rounded,
                size: 100,
                color: Color(0xFF2196F3),
              ),
              const SizedBox(height: 24),
              Text(
                '건강 체크',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: const Color(0xFF2196F3),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '어르신의 건강을 응원합니다',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.blueGrey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 명칭 수정을 위해 임시로 _SplashScreenState 정의
class _SplashScreenState extends _ConsumerState {}
