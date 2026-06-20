import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router.dart';
import 'core/providers/settings_provider.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final container = ProviderContainer();
  // 설정 로드 대기
  await container.read(settingsProvider.notifier).init();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final settings = ref.watch(settingsProvider);

    return MaterialApp.router(
      title: 'Senior Check State',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.highContrastTheme,
      themeMode: settings.isHighContrast ? ThemeMode.dark : ThemeMode.light,
      routerConfig: router,
      builder: (context, child) {
        // 폰트 스케일 적용
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(settings.fontScale.scale),
          ),
          child: child!,
        );
      },
    );
  }
}
