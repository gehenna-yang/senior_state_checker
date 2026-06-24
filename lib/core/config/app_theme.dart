// lib/core/config/app_theme.dart

import 'package:flutter/material.dart';

/// 시니어 사용자를 위한 앱 테마 설정 클래스
/// 파란색과 초록색의 파스텔톤을 조합하여 현대적이고 깔끔한 UI를 제공합니다.
class AppTheme {
  // 시니어 친화적 파스텔 컬러 팔레트 (파란색, 초록색 중심)
  static const Color pastelBlue = Color(0xFFE3F2FD);   // 배경용 연파랑
  static const Color primaryBlue = Color(0xFF2196F3);  // 포인트용 파랑
  static const Color pastelGreen = Color(0xFFE8F5E9);  // 배경용 연초록
  static const Color primaryGreen = Color(0xFF4CAF50); // 포인트용 초록
  static const Color softGrey = Color(0xFFF5F5F5);    // 기본 배경용 그레이

  static ThemeData get seniorTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        secondary: primaryGreen,
        brightness: Brightness.light,
        surface: Colors.white,
      ),
      
      // 텍스트 테마: 가독성을 위해 기본 크기를 키우고 굵기를 조절
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87),
        headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black87),
        titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
        bodyLarge: TextStyle(fontSize: 20, color: Colors.black87),
        bodyMedium: TextStyle(fontSize: 18, color: Colors.black54),
        labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),

      // 앱바 테마
      appBarTheme: const AppBarTheme(
        centerTitle: false, // 제목은 왼쪽, 햄버거는 우측
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 24, 
          fontWeight: FontWeight.bold, 
          color: primaryBlue
        ),
        iconTheme: IconThemeData(size: 28, color: primaryBlue),
      ),

      // 카드 테마
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: pastelBlue, width: 1),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),

      // 버튼 테마
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 60),
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),

      // 스위치 및 체크박스 테마
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) => 
          states.contains(WidgetState.selected) ? primaryGreen : Colors.white),
        trackColor: WidgetStateProperty.resolveWith((states) => 
          states.contains(WidgetState.selected) ? primaryGreen.withOpacity(0.5) : Colors.grey[300]),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) => 
          states.contains(WidgetState.selected) ? primaryGreen : Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),

      // 하단 탭바 테마 (필요 시)
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryBlue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 14),
      ),
    );
  }
}
