// test/voice_state_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senior_check_state/state/voice_check_state.dart';

void main() {
  group('VoiceCheckNotifier 단위 테스트 (Feature 1, 2)', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('초기 상태 확인', () {
      final state = container.read(voiceCheckNotifierProvider);
      expect(state.status, VoiceStatus.idle);
      expect(state.recognizedText, '');
      expect(state.isVoiceMainMode, true); // 기본값은 true
    });

    test('보이스 메인 모드 토글 테스트 (Feature 2)', () {
      final notifier = container.read(voiceCheckNotifierProvider.notifier);
      
      notifier.toggleVoiceMainMode();
      expect(container.read(voiceCheckNotifierProvider).isVoiceMainMode, false);
      
      notifier.toggleVoiceMainMode();
      expect(container.read(voiceCheckNotifierProvider).isVoiceMainMode, true);
    });

    test('음성 인식 상태 업데이트 테스트 (Feature 1)', () {
      final notifier = container.read(voiceCheckNotifierProvider.notifier);
      
      notifier.updateStatus(VoiceStatus.listening);
      expect(container.read(voiceCheckNotifierProvider).status, VoiceStatus.listening);
      
      notifier.setRecognizedText('혈압약 먹었어');
      expect(container.read(voiceCheckNotifierProvider).recognizedText, '혈압약 먹었어');
    });

    test('에러 발생 및 초기화 테스트', () {
      final notifier = container.read(voiceCheckNotifierProvider.notifier);
      
      notifier.setError('마이크 권한이 없습니다.');
      final errorState = container.read(voiceCheckNotifierProvider);
      expect(errorState.status, VoiceStatus.failure);
      expect(errorState.errorMessage, '마이크 권한이 없습니다.');
      
      notifier.reset();
      final resetState = container.read(voiceCheckNotifierProvider);
      expect(resetState.status, VoiceStatus.idle);
      expect(resetState.recognizedText, '');
      expect(resetState.errorMessage, null);
    });
  });
}
