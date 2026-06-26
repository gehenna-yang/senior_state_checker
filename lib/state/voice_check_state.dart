// lib/state/voice_check_state.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:senior_check_state/ui/utils/dprint.dart';

part 'voice_check_state.freezed.dart';
part 'voice_check_state.g.dart';

/// 음성 인식 과정의 상태를 정의합니다.
enum VoiceStatus {
  idle,       // 대기 중
  listening,  // 음성 듣는 중
  processing, // 분석 중
  success,    // 성공
  failure     // 에러 발생
}

@freezed
class VoiceCheckState with _$VoiceCheckState {
  const factory VoiceCheckState({
    /// 현재 음성 인식의 진행 상태
    @Default(VoiceStatus.idle) VoiceStatus status,
    
    /// 인식된 텍스트 결과
    @Default('') String recognizedText,
    
    /// 보이스 모드가 메인인지 여부 (Feature 2 핵심 설정)
    @Default(true) bool isVoiceMainMode,
    
    /// 화면에 표시할 에러 메시지
    String? errorMessage,
  }) = _VoiceCheckState;
}

@riverpod
class VoiceCheckNotifier extends _$VoiceCheckNotifier {
  @override
  VoiceCheckState build() {
    // 초기 설정값 로드 로직을 여기에 추가할 수 있습니다.
    return const VoiceCheckState();
  }

  /// 보이스 메인 모드 설정을 토글합니다.
  void toggleVoiceMainMode() {
    state = state.copyWith(isVoiceMainMode: !state.isVoiceMainMode);
  }

  /// 음성 인식 상태를 업데이트합니다.
  void updateStatus(VoiceStatus status) {
    state = state.copyWith(
      status: status,
      errorMessage: status == VoiceStatus.idle ? null : state.errorMessage,
    );
  }

  /// 인식된 텍스트를 저장합니다.
  void setRecognizedText(String text) {
    dprint('## recognized text : $text');
    state = state.copyWith(recognizedText: text);
  }

  /// 에러 발생 시 메시지와 함께 상태를 변경합니다.
  void setError(String message) {
    dprint('## recognized error : $message');
    state = state.copyWith(
      status: VoiceStatus.failure,
      errorMessage: message,
    );
  }

  /// 상태를 초기화합니다.
  void reset() {
    state = state.copyWith(
      status: VoiceStatus.idle,
      recognizedText: '',
      errorMessage: null,
    );
  }
}
