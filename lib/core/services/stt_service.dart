// lib/core/services/stt_service.dart

import 'package:senior_check_state/ui/utils/dprint.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';

part 'stt_service.g.dart';

/// 음성 인식(STT) 기능을 담당하는 로직 클래스
/// 시니어 사용자를 위한 에러 방어 및 직관적인 안내 처리를 포함합니다.
class STTService {
  final SpeechToText _speech = SpeechToText();

  /// 음성 인식 엔진 초기화
  /// [onError] 콜백을 통해 권한 거부 등의 상황을 처리합니다.
  Future<bool> initialize({
    required Function(String) onStatus,
    required Function(String) onError,
  }) async {
    try {
      final isAvailable = await _speech.initialize(
        onStatus: (status) => onStatus(status),
        onError: (errorNotification) {
          // 에러 메시지에 포함된 키워드로 사용자 친화적 안내 제공
          String userMessage = '음성 인식 중 오류가 발생했습니다.';
          final errorText = errorNotification.errorMsg.toLowerCase();
          
          if (errorText.contains('permission')) {
            userMessage = '마이크 권한이 필요합니다. 설정에서 허용해 주세요.';
          } else if (errorText.contains('network')) {
            userMessage = '인터넷 연결을 확인해 주세요.';
          }
          onError(userMessage);
        },
      );
      return isAvailable;
    } catch (e) {
      onError('음성 인식 시스템을 시작할 수 없습니다: $e');
      return false;
    }
  }

  /// 음성 듣기 시작 로직 (Try-Catch 필수 적용)
  Future<void> listen({
    required Function(String) onResult,
    required Function() onDone,
    required Function(String) onError,
  }) async {
    try {
      final isAvailable = await _speech.initialize();
      if (!isAvailable) {
        onError('현재 기기에서 음성 인식을 사용할 수 없습니다.');
        return;
      }

      await _speech.listen(
        onResult: (result) {
          dprint('## listen result: $result');
          if (result.finalResult) {
            onResult(result.recognizedWords);
            onDone();
          }
        },
        listenOptions: SpeechListenOptions(
          localeId: 'ko_KR',
          listenFor: const Duration(seconds: 10),
          pauseFor: const Duration(seconds: 3),
          cancelOnError: true,
        ),
      );
    } on TimeoutException {
      onError('말씀이 없으셔서 인식을 종료했습니다.');
    } catch (e) {
      onError('목소리를 듣는 중 문제가 발생했습니다: $e');
    }
  }

  /// 음성 듣기 중지
  Future<void> stop() async {
    await _speech.stop();
  }

  /// 마이크 리소스 해제
  void dispose() {
    _speech.cancel();
  }
}

@riverpod
STTService sttService(SttServiceRef ref) {
  final service = STTService();
  ref.onDispose(() => service.dispose());
  return service;
}
