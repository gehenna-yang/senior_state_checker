import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../ui/main_screen.dart';
import '../ui/home/home_screen.dart';
import '../ui/home/add_edit_item_screen.dart';
import '../ui/search/search_screen.dart';
import '../ui/profile/profile_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  
  return GoRouter(
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomeScreen(),
                routes: [
                  GoRoute(
                    path: 'add-item',
                    builder: (context, state) => const AddEditItemScreen(),
                  ),
                  GoRoute(
                    path: 'edit-item/:id',
                    builder: (context, state) {
                      final id = state.pathParameters['id'];
                      return AddEditItemScreen(itemId: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
