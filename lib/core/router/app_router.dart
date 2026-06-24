// lib/core/router/app_router.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../ui/screens/home/home_screen.dart';
import '../../ui/screens/search/search_screen.dart'; // HistoryScreen으로 활용
import '../../ui/screens/profile/profile_screen.dart'; // SettingsScreen으로 활용
import '../../ui/screens/home/add_edit_item_screen.dart'; // ManagementScreen으로 활용

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return _AppLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/history',
            name: 'history',
            builder: (context, state) => const SearchScreen(),
          ),
          GoRoute(
            path: '/items',
            name: 'items',
            builder: (context, state) => const AddEditItemScreen(),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}

class _AppLayout extends StatelessWidget {
  final Widget child;
  const _AppLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    // 현재 경로에 따라 타이틀 결정
    final location = GoRouterState.of(context).uri.path;
    String title = '오늘의 체크';
    if (location == '/history') title = '과거 기록';
    if (location == '/items') title = '항목 관리';
    if (location == '/settings') title = '앱 설정';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          // 우측 상단 햄버거 버튼
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, size: 32),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      // 우측 슬라이드 메뉴 (EndDrawer)
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF2196F3)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.face, size: 50, color: Colors.white),
                    SizedBox(height: 12),
                    Text('행복한 하루 되세요!', 
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            _menuTile(context, Icons.home, '홈 화면', '/'),
            _menuTile(context, Icons.history, '과거 기록', '/history'),
            _menuTile(context, Icons.list_alt, '체크 항목 관리', '/items'),
            _menuTile(context, Icons.settings, '앱 설정', '/settings'),
          ],
        ),
      ),
      body: child,
    );
  }

  Widget _menuTile(BuildContext context, IconData icon, String label, String path) {
    final isSelected = GoRouterState.of(context).uri.path == path;
    return ListTile(
      leading: Icon(icon, color: isSelected ? const Color(0xFF2196F3) : Colors.grey[700], size: 28),
      title: Text(label, style: TextStyle(
        fontSize: 20, 
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        color: isSelected ? const Color(0xFF2196F3) : Colors.black87,
      )),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      onTap: () {
        Navigator.pop(context); // 메뉴 닫기
        context.go(path);
      },
    );
  }
}
