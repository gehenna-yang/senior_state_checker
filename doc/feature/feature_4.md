# Feature Request: [보이스 결과 처리 로직 구현]

## 1. Objective (목표)
* 보이스에서 전달받은 텍스트를 상태 기록한다.

## 2. Scope of Work (작업 범위)
* [ ] `home_screen`의 `VoiceMainBody`에서 stt로 전달받은 결과값 **voiceState.recognizedText**를 local에 저장된 체크항목 리스트에 일치하는게 있는지 확인
* [ ] 체크 항목과 일치하는것이 있을경우 해당 항목을 기록한다.

## 3. Edge Cases & Error Handling (고려할 예외 상황)
* [상황 1] **voiceState.recognizedText** 값이 체크항목 리스트에 존재하지 않는경우 다이얼로그로 해당 항목이 존재하지 않는다고 보여준다.

## 4. Implementation Plan (구현 계획)
1. `lib/state/voice_check_state.dart`: `recognizedText`가 변경될 때 체크리스트와 비교하는 로직 추가
2. `lib/ui/screens/home/widgets/item_check_dialog.dart`: 인식 결과에 따른 다이얼로그 표시 로직 추가
3. `lib/data/repositories/check_item_repository.dart`: 로컬 체크항목 리스트 조회 기능 개발

## 5. Verification Plan (검증 계획)
* **Logic Test**: 음성 인식 결과(`recognizedText`)가 체크 리스트 항목과 일치할 때 상태가 올바르게 업데이트되는지 확인.
* **UI/UX Test**: 인식된 텍스트가 리스트에 없을 경우 사용자에게 알림 다이얼로그가 정상적으로 표시되는지 확인.
* **Data Test**: 로컬 저장소에서 체크 항목 리스트를 정상적으로 불러오는지 확인.
