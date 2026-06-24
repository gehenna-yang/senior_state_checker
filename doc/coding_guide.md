# Coding Guidelines & Rules

AI 에이전트는 코드 작성 시 아래의 아키텍처 규칙과 STT/로컬 스토리지 제약 조건을 반드시 준수한다.

## 1. Mock Backend & Local Storage Rules
* **인터페이스 의존성:** State나 UI 계층은 Mock 구현체에 직접 의존해서는 안 되며, 반드시 Repository 인터페이스를 의존성 주입(DI)받아 사용해야 한다.
* **데이터 영속성:** 투약, 식사, 운동 기록 및 앱 설정 값은 로컬 스토리지에 JSON 직렬화하여 저장하고, 앱이 재시작되어도 유지되어야 한다.
* **가상 지연(Simulated Delay):** Mock Repository 호출 시 실제 네트워크 통신 느낌을 주기 위해 `Future.delayed(Duration(milliseconds: 500))`를 의도적으로 추가하여 로딩 상태(Loading State)를 검증한다.

## 2. STT (Speech-to-Text) & Settings Rules
* **UI 모드 전환:** 시스템은 설정 값(`isVoiceMainMode: bool`)을 감시해야 한다.
    * `true`일 때: 메인 화면 중심에 거대한 마이크 버튼이 상시 노출되며 즉시 음성 입력 모드로 진입.
    * `false`일 때: 기존 수동 입력 폼이 메인이며, 사용자가 '음성으로 입력하기' 버튼을 추가로 눌러야 동작.
* **에러 방어 및 예외 처리:** * 마이크 권한 거부, 음성 인식 실패(침묵, 소음 등) 발생 시 앱이 멈추지 않고 "다시 한번 천천히 말씀해 주세요" 등의 명확한 한글 가이드를 화면에 노출해야 한다.
    * STT 파싱 실패 시 수동 키보드 입력으로 즉시 백업 전환될 수 있는 UI 구조를 갖춘다.

## 3. UI/UX 접근성 및 에러 핸들링
* 로컬 스토리지 읽기/쓰기 실패 시(`CacheException` 등) 화면에 시스템 에러 코드를 노출하지 말고, "기록을 저장하지 못했습니다. 다시 시도해 주세요"라는 알림을 띄운다.

## 4. Coding Conventions
* **Immutability:** 모든 데이터 모델은 `Freezed`를 사용하여 불변성을 유지한다.
* **Dependency Injection:** Repository 구현체는 Provider를 통해 주입하며, 테스트 및 백엔드 교체가 용이하도록 설계한다.
* **Accessibility:** 모든 텍스트 크기와 버튼 영역은 노령층 사용자를 위해 표준 가이드보다 크게 설정한다.

## 5. State Management (Riverpod)
* **Generator 사용:** 모든 Provider는 `riverpod_generator`를 사용하여 정의한다 (`@riverpod` 어노테이션 사용).
* **Notifier 중심:** 단순 데이터 조회 외의 비즈니스 로직은 `AsyncNotifier` 또는 `Notifier` 클래스 내부에 캡슐화한다.
* **Side Effects:** 데이터 변경(Create/Update/Delete) 후에는 `ref.invalidate()`를 통해 UI 상태를 최신화한다.
* **Provider Scope:** 전역 상태는 최소화하고, 화면 단위의 상태는 해당 위젯 트리 근처에서 관리될 수 있도록 설계한다.

## 6. Models & Serialization
* **Freezed 사용:** 모든 데이터 모델은 `@freezed`를 사용하여 정의하며, `copyWith`를 통한 불변 객체 수정을 원칙으로 한다.
* **JSON 변환:** 로컬 스토리지 저장 및 API 통신을 위해 `fromJson`, `toJson` 팩토리 메서드를 반드시 포함한다.
* **Union Types:** 상태(Success, Error, Loading)나 다양한 기록 타입(식사, 운동, 투약)을 구분할 때 Freezed의 Union/Sealed 클래스 기능을 활용한다.
* **Default Values:** 노령층 데이터 입력 누락을 방지하기 위해 `@Default` 어노테이션을 사용하여 기본값을 명시적으로 지정한다.

## 7. Repository Pattern
* **Interface First:** 모든 Repository는 `abstract class`로 인터페이스를 먼저 정의한다.
* **Mock Implementation:** 초기 개발 단계에서는 `Mock` 접두사를 붙인 구현체(예: `MockHealthRepository`)를 작성하여 로컬 스토리지와 연동한다.
* **Error Mapping:** 데이터 소스(SharedPreferences)의 예외는 Repository 계층에서 도메인 예외로 변환하여 상위 계층으로 던진다.
* **Provider Injection:** 구현체는 `@riverpod`을 통해 제공하며, 외부에서는 인터페이스 타입을 참조하도록 설정한다.

## 8. UI & Accessibility (Senior-First)
* **Touch Targets:** 모든 버튼과 클릭 가능한 요소는 최소 40x40 이상의 크기를 유지하며, 충분한 여백을 둔다.
* **Typography:** 기본 폰트 크기는 16 이상으로 설정하며, `fontWeight`를 활용하여 가독성을 높인다.
* **Contrast:** 배경과 텍스트 간의 대비를 명확히 하여 저시력 사용자를 배려한다.
* **Feedback:** 버튼 클릭이나 상태 변경 시 진동(Haptic) 또는 시각적 피드백을 명확히 제공한다.
* **Voice Integration:** STT 입력 중에는 파형 애니메이션이나 "듣고 있어요"와 같은 상태 메시지를 반드시 표시한다.
