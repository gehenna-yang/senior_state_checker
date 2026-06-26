// lib/core/services/permission_service.dart

import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permission_service.g.dart';

/// 앱의 필수 권한을 관리하는 서비스 클래스
/// 시니어 사용자의 편의를 위해 마이크 및 음성 인식 권한을 중점적으로 처리합니다.
class PermissionService {
  /// 마이크 및 음성 인식 권한을 한 번에 요청합니다.
  Future<bool> requestVoicePermissions() async {
    // 마이크 및 음성 인식 권한 상태 확인
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.speech,
    ].request();

    // 모든 권한이 허용되었는지 확인
    bool allGranted = statuses.values.every((status) => status.isGranted);
    
    return allGranted;
  }

  /// 현재 마이크 권한 상태를 확인합니다.
  Future<bool> isMicrophoneGranted() async {
    return await Permission.microphone.isGranted;
  }

  /// 현재 음성 인식 권한 상태를 확인합니다.
  Future<bool> isSpeechGranted() async {
    return await Permission.speech.isGranted;
  }

  /// 권한 거부 시 설정 화면으로 이동하도록 유도하는 함수
  Future<void> openAppSettingsPage() async {
    await openAppSettings();
  }
}

@riverpod
PermissionService permissionService(PermissionServiceRef ref) {
  return PermissionService();
}
