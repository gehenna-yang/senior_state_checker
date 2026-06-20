# 프로젝트 목표
- 사용자(어르신)들의 투약, 식사 등등 상태를 체크하기위함
- 사용자들의 정보를 공유자들에게 내용을 공유하고 편집 권한을 제공
- 사용자들의 편의성을 위해 보이스를 통해 상태를 체크할 수 있도록함

## 기술 스택
- Language: Dart
- Framework: Flutter
- State Management: Riverpod
- Backend: Mock
- Code Generator: Freezed, Riverpod, JsonSerialize
- Voice Recognition: speech_to_text
- Local Storage: shared_preferences or drift (for local caching)

## 앱 기능 정리
기능에 대한 자세한 정의는 function.md 참조

## 개발 마일스톤
- [ ] 프로젝트 환경 설정 및 기본 아키텍처 설계 (Riverpod + Clean Architecture)
- [ ] UI/UX 디자인 및 퍼블리싱 (어르신 친화적 큰 글씨 UI)
- [ ] 핵심 기능 구현 (상태 체크, STT 보이스 인식 연동)
- [ ] 보호자 공유 및 실시간 알림 시스템 구현
- [ ] 데이터 분석 및 통계 대시보드 구현
- [ ] 테스트 및 버그 수정 (QA)
- [ ] 스토어 배포 준비

## 아키텍처 구조
- **Presentation Layer**: UI Components & Riverpod Providers
- **Domain Layer**: Entities & UseCases (Business Logic)
- **Data Layer**: Repositories & Data Sources (Mock/Local)

## 폴더 구조 (Proposed)
```text
lib/
 ├── core/              # 공통 유틸리티, 테마, 상수
 ├── domain/            # 비즈니스 로직 (Entities, UseCases, Repository Interfaces)
 ├── data/              # 데이터 소스 (DTOs, Mappers, Repository Impls)
 ├── ui/      # UI (Screens, Widgets, Providers)
 └── main.dart          # 진입점
```

## 코딩 컨벤션 및 규칙
- **Naming**: 클래스는 `PascalCase`, 변수 및 함수는 `camelCase`, 파일명은 `snake_case`를 사용합니다.
- **State Management**: UI 로직과 상태 관리는 Riverpod(Generator)을 우선적으로 사용합니다.
- **Immutability**: 모든 Data Model은 `Freezed`를 사용하여 불변 객체로 정의합니다.
- **Error Handling**: Result 패턴 또는 Exception 처리를 통해 데이터 레이어의 에러가 UI 레이어까지 안전하게 전달되도록 설계합니다.
- **UI**: 모든 위젯은 `StatelessWidget`을 지향하며, 상태가 필요한 경우 `ConsumerWidget`을 사용합니다.

## 주요 라이브러리 상세
- `riverpod_generator`: Type-safe한 Provider 생성을 위해 사용
- `freezed`: 불변 객체 및 Union Type 지원
- `speech_to_text`: 어르신 음성 명령 인식을 위한 패키지
- `json_serializable`: JSON 직렬화 및 역직렬화 자동화
- `shared_preferences`: 로컬 데이터 캐싱 및 영속성 관리
- `dio`: HTTP 네트워킹 및 API 통신 (Mock 데이터 전환 시 활용)
- `go_router`: 선언적 라우팅 및 딥링크 지원

## 테스트 전략
- **Unit Test**: Domain Layer의 UseCase 및 Business Logic 검증
- **Widget Test**: 주요 UI 컴포넌트의 렌더링 및 사용자 상호작용 검증
- **Integration Test**: 전체적인 앱 시나리오 및 STT 연동 흐름 확인

## 코드 품질 관리
- **Linter**: `flutter_lints` 또는 `riverpod_lint`를 사용하여 정적 분석을 수행합니다.
- **Formatting**: `dart format`을 사용하여 일관된 코드 스타일을 유지합니다.
- **Code Review**: 모든 PR은 최소 1명 이상의 리뷰어 승인 후 머지하는 것을 원칙으로 합니다.

## 보안 및 데이터 관리
- **Sensitive Data**: API Key, Secret 등은 `envied` 또는 `--dart-define`을 사용하여 소스 코드에 노출되지 않도록 관리합니다.
- **Privacy**: 어르신의 개인정보 및 건강 데이터는 로컬 저장 시 암호화 여부를 검토하며, 최소한의 데이터만 수집합니다.

## 성능 최적화
- **Image Optimization**: 고해상도 이미지는 캐싱 처리 및 적절한 사이즈로 리사이징하여 메모리 점유율을 최소화합니다.
- **Build Optimization**: `const` 생성자를 적극 활용하여 불필요한 위젯 리빌드를 방지합니다.
- **List Rendering**: 긴 목록은 `ListView.builder`를 사용하여 지연 렌더링(Lazy Loading)을 적용합니다.

## 접근성 (Accessibility)
- **Text Scaling**: 사용자의 시스템 글꼴 크기 설정에 대응할 수 있도록 유연한 레이아웃을 설계합니다.
- **Contrast**: 시력이 약한 어르신들을 위해 텍스트와 배경 간의 높은 대비를 유지합니다.
- **Semantics**: `Semantics` 위젯을 활용하여 스크린 리더(TalkBack/VoiceOver) 지원을 강화합니다.

## 다국어 지원 (Internationalization)
- **Library**: `flutter_localizations` 및 `intl` 패키지를 사용하여 다국어를 관리합니다.
- **Management**: 모든 하드코딩된 문자열은 `arb` 파일로 분리하여 관리하며, 언어 변경 시 즉각적으로 UI에 반영되도록 설계합니다.

## 환경 설정 및 로깅
- **Flavor**: `dev`, `prod` 환경을 분리하여 API 엔드포인트 및 앱 아이콘/이름을 차별화합니다.
- **Logging**: `logger` 패키지를 사용하여 로그 레벨(debug, info, error)을 관리하며, Production 환경에서는 로그가 노출되지 않도록 설정합니다.
- **Error Tracking**: `Sentry` 또는 `Firebase Crashlytics`를 연동하여 런타임 에러를 실시간으로 모니터링합니다.

## 유지보수 및 향후 확장성
- **Dependency Management**: `dependabot` 등을 활용하여 정기적으로 패키지 버전을 업데이트하고 보안 취약점을 점검합니다.
- **Modularization**: 기능 단위가 커질 경우 `package` 단위로 모듈을 분리하여 빌드 속도 및 코드 재사용성을 높입니다.




