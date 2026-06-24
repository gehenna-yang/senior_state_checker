# Feature Request: [보이스를 사용한 상태 체크 기능]

## 1. Objective (목표)
* 보이스 기능을 활용한 상태 체크 기록용 기능 생성

## 2. Scope of Work (작업 범위)
* [ ] STT 패키지(예: `speech_to_text`) 연동 및 음성 인식 핸들러 작성
* [ ] 음성 텍스트 분석을 통한 상태 데이터(기분, 통증 등) 추출 로직 구현
* [ ] 로컬 스토리지 기반의 `MockHealthRecordRepository` 구현 (데이터 CRUD)
* [ ] 음성 인식 상태 및 결과 데이터를 관리하는 StateNotifier 작성
* [ ] 시니어 친화적인 음성 입력 UI(마이크 애니메이션, 텍스트 피드백) 구현

## 3. Edge Cases & Error Handling (고려할 예외 상황)
* [상황 1] 사용자가 음성 입력을 켰으나 아무 말도 하지 않아 STT 타임아웃이 발생한 경우의 처리.
* [상황 2] 로컬 스토리지에 저장된 데이터가 없거나(첫 진입) 포맷이 깨진 경우의 초기화(Default 값) 처리.
* [상황 3] 음성 인식 도중 취소 버튼을 누르거나 화면을 벗어났을 때 마이크 리소스 해제(Dispose) 처리.

## 4. Expected Output (예상 출력)
1. Mock 백엔드 처리를 위한 Repository 계층 코드
2. STT 제어를 위한 State 계층 코드

## 5. Technical Specification (기술 명세)
* **Data Model**: `StateCheck` (id, mood, painLevel, note, createdAt)
* **Repository**: `MockStateCheckRepository` (saveRecord, getRecords, deleteRecord)
* **State Management**: `Riverpod` (StateNotifierProvider)
* **Storage**: `shared_preferences` 또는 `path_provider`를 활용한 JSON 파일 저장

## 6. Implementation Plan (구현 계획)
1. `lib/models/state_check.dart` 정의
2. `lib/repositories/state_check_repository.dart` 인터페이스 및 Mock 구현
3. `lib/utils/stt_helper.dart` (STT 로직 캡슐화)
4. `lib/state/voice_check_state.dart` 상태 관리 구현
5. `lib/widgets/voice_input_feature.dart` UI 구현
6. `lib/widgets/mic_wave_animation.dart` 추가

## 7. Verification Plan (검증 계획)
* **Unit Test**: `StateCheck` 모델의 JSON 직렬화 및 `MockStateCheckRepository`의 CRUD 동작 확인.
* **Provider Test**: 음성 인식 결과에 따른 상태 변화(Idle -> Listening -> Processing -> Success) 검증.
* **UI/UX Test**: 시니어 사용자를 고려한 마이크 버튼 크기 및 텍스트 가독성 확인.
