import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'voice_service.g.dart';

@riverpod
class VoiceService extends _$VoiceService {
  late SpeechToText _speech;
  bool _isAvailable = false;

  @override
  FutureOr<bool> build() async {
    _speech = SpeechToText();
    _isAvailable = await _speech.initialize(
      onStatus: (status) {},
      onError: (error) {},
    );
    return _isAvailable;
  }

  Future<void> startListening({
    required Function(String) onResult,
    required Function(bool) onListeningStateChanged,
  }) async {
    if (!_isAvailable) return;

    onListeningStateChanged(true);
    await _speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          onResult(result.recognizedWords);
          onListeningStateChanged(false);
        }
      },
      localeId: 'ko_KR', // 한국어 설정
    );
  }

  Future<void> stopListening() async {
    await _speech.stop();
  }
}
