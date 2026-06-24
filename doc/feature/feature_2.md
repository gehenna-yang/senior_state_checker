# Feature Request: [보이스 메인 설정]

## 1. Objective (목표)
* 사용자가 `setting_screen` 에서 '보이스 입력 메인으로 사용'을 토글할 수 있게 하고, 이 설정 값에 따라 메인 화면의 입력 방식(Voice-First UI vs Manual UI)이 동적으로 바뀌며, 입력된 데이터는 로컬 스토리지 Mock 백엔드에 저장되는 기능을 구현한다.

## 2. Scope of Work (작업 범위)
* [ ] 앱 설정(보이스 메인 여부)을 저장할 `AppSettings` 모델 및 로컬 스토리지 저장 로직
* [ ] 설정 값에 따라 메인 화면 구성을 바꾸는 State 관리 로직
* [ ] STT 패키지(예: `speech_to_text`) 연동 및 음성 인식 핸들러 작성
* [ ] 로컬 스토리지 기반의 `MockHealthRecordRepository` 구현 (데이터 CRUD)
* [ ] 노령층이 쉽게 조작할 수 있는 설정 화면 및 메인 화면 UI 위젯

## 3. Edge Cases & Error Handling (고려할 예외 상황)
* [상황 1] 사용자가 음성 입력을 켰으나 아무 말도 하지 않아 STT 타임아웃이 발생한 경우의 처리.
* [상황 2] 로컬 스토리지에 저장된 데이터가 없거나(첫 진입) 포맷이 깨진 경우의 초기화(Default 값) 처리.
* [상황 3] 음성 인식 도중 취소 버튼을 누르거나 화면을 벗어났을 때 마이크 리소스 해제(Dispose) 처리.

## 4. Expected Output
1. Local Storage에 설정 저장 계층 코드
2. UI 모드 전환 및 STT 제어를 위한 State 계층 코드

## 5. Technical Specification (기술 명세)
* **State Management**: `Riverpod` (StateNotifierProvider)
* **Storage**: `shared_preferences` 또는 `path_provider`를 활용한 JSON 파일 저장

## 6. Implementation Plan (구현 계획)
1. `lib/models/app_settings.dart`: 보이스 메인 사용 여부를 담는 데이터 모델 정의.
2. `lib/repositories/settings_repository.dart`: `shared_preferences`를 이용한 설정값 영속화 로직 구현.
3. `lib/state/settings_state.dart`: 설정 상태를 관리하고 UI에 변경사항을 알리는 Riverpod Provider 작성.
4. `lib/screens/home_screen.dart`: 설정값에 따라 `VoiceMainBody` 또는 `ManualMainBody`를 조건부 렌더링하도록 수정.

## 7. Verification Plan (검증 계획)
* **Unit Test**: `StateCheck` 모델의 JSON 직렬화 및 `MockStateCheckRepository`의 CRUD 동작 확인.
* **Provider Test**: 음성 인식 결과에 따른 상태 변화(Idle -> Listening -> Processing -> Success) 검증.
* **UI/UX Test**: 시니어 사용자를 고려한 마이크 버튼 크기 및 텍스트 가독성 확인.
