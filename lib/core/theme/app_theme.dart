import 'package:flutter/material.dart';

class AppTheme {
  // 기본 테마
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  // 고대비 테마 (어르신 시인성 강화)
  static ThemeData get highContrastTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Colors.yellowAccent,
        secondary: Colors.cyanAccent,
        surface: Colors.black,
        onSurface: Colors.white,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.black,
      cardTheme: const CardTheme(
        color: Color(0xFF1E1E1E),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.yellowAccent;
          }
          return Colors.white;
        }),
        checkColor: WidgetStateProperty.all(Colors.black),
      ),
    );
  }
}
