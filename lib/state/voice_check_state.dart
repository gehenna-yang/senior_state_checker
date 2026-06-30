// lib/state/voice_check_state.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import '../models/state_check_model.dart';
import '../core/repositories/state_check_repository.dart';
import '../core/repositories/mock_state_check_repository.dart'; // 프로바이더 참조를 위해 추가
import '../core/repositories/check_item_repository.dart';
import '../ui/utils/dprint.dart';

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

  /// 인식된 텍스트를 분석하고 기록을 생성합니다. (Feature 4 핵심 로직)
  Future<CheckMatchResult> processVoiceResult(String text) async {
    updateStatus(VoiceStatus.processing);
    setRecognizedText(text);

    final checkItemRepo = ref.read(checkItemRepositoryProvider);
    final stateCheckRepo = ref.read(stateCheckRepositoryProvider);

    // 1. 등록된 체크 항목 마스터 데이터 가져오기
    final masterItems = await checkItemRepo.getCheckItems();
    
    // 2. 텍스트 매칭 시도 (어르신의 발음 유연성을 고려하여 포함 여부로 체크)
    String? matchedTitle;
    for (var master in masterItems) {
      for (var itemName in master.items) {
        if (text.contains(itemName)) {
          matchedTitle = itemName;
          break;
        }
      }
      if (matchedTitle != null) break;
    }

    // 3. 매칭 결과에 따른 분기 처리
    if (matchedTitle != null) {
      // 일치하는 항목 발견: 상태 기록 자동 생성
      final newRecord = StateCheckModel(
        id: const Uuid().v4(),
        createdAt: DateTime.now(),
        state: 'VOICE_CHECK',
        content: matchedTitle,
        note: '음성 인식을 통해 자동으로 기록되었습니다.',
      );

      await stateCheckRepo.saveRecord(newRecord);
      updateStatus(VoiceStatus.success);
      return CheckMatchResult(isSuccess: true, matchedItem: matchedTitle);
    } else {
      // 일치하는 항목 없음
      updateStatus(VoiceStatus.failure);
      return CheckMatchResult(isSuccess: false);
    }
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

/// 음성 매칭 결과를 담는 간단한 클래스
class CheckMatchResult {
  final bool isSuccess;
  final String? matchedItem;

  CheckMatchResult({required this.isSuccess, this.matchedItem});
}
