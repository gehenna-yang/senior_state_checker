# Project Context & Architecture

## 1. Project Overview (프로젝트 개요)
* **Target Audience:** 노령층 (주 사용자) 및 그들의 가족 (보호자 및 공유자).
* **Core Features:** 
  1. 투약, 식사, 운동, 사용자가 생성한 check_item 기록 및 체크.
  2. STT(Speech-to-Text) 기반의 보이스 입력 시스템 (핵심 입력 수단).
  3. 가족 그룹(Family Group) 간 데이터 동기화 및 기록 공유.
* **UX/UI Core Value:** 
  1. 설정에 따라 보이스 입력 중심의 UI(Voice-First Mode) 또는 사용자가 직접 추가하는 UI(Manual Mode)로 전환 가능해야 함.

## 2. Tech Stack & Environment
* **Frontend:** Flutter 3.44.2 (Android/iOS)
* **Router:** GoRouter
* **State Management:** RiverPod
* **Model Code Genenrator:** Freezed, JsonSerialize
* **Code Generator:** Freezed, JsonSerialize, RiverPod Generator
* **Data Layer (Current):** 백엔드 미구현 상태로, Local Storage(`shared_preferences` 또는 `Hive`)를 활용한 **Mock 백엔드**로 구동.
* **Data Layer (Future):** Python REST API 및 PostgreSQL 환경으로 전환 예정.

## 3. Architecture & Interface Abstraction (중요)
추후 실제 백엔드로의 원활한 전환을 위해 Data 계층은 반드시 인터페이스(추상 클래스)로 격리한다.

* `lib/core/config/`: 앱 전역 설정, 상수(API 엔드포인트, 디자인 시스템 수치, 컬러), 테마 설정, 권한 요청
* `lib/core/router/`: GoRouter 기반 네비게이션 및 라우트 정의
* `lib/core/repositories/`: 데이터 통신 인터페이스 정의 및 로컬 스토리지를 활용한 가상 데이터베이스 및 Mock 백엔드 로직 
* `lib/models/`: Freezed 기반 데이터 모델 및 DTO
* `lib/state/`: Riverpod Generator 기반 상태(Notifier) 로직 처리
* `lib/ui/screens/`: 기능별 주요 화면 (메인, 설정, 기록 상세 등) 상태(Notifier)에 따른 UI 변경 로직. 
* `lib/ui/widgets/`: 재사용 가능한 UI 컴포넌트들
* `lib/ui/utils/`: 재사용 가능한 util 컴포넌트들 

## 4. Directory Structure (권장 구조)
```text
lib/
├── core/             # 공통 유틸리티, 테마, 상수, Mock DB
│   ├── config/       # 앱 설정 및 테마, 권한 요청
│   ├── router/       # 네비게이션 정의
│   └── repositories/ # 로컬 Mock 데이터베이스, 추상 인터페이스 및 Remote 구현체
├── models/           # Freezed 기반 데이터 모델 및 DTO
├── state/            # Riverpod Generator 기반 전역 상태 제공자
├── ui/
│   ├── screens/      # 기능별 주요 화면
│   ├── widgets/      # 재사용 가능한 공통 컴포넌트
│   └── utils/        # 재사용 가능한 util 컴포넌트들
└── main.dart         # 앱 진입점 및 ProviderScope 설정
```

## 5. Coding Guide
* coding_guide.md 파일을 참조 룰에 맞춰 코딩한다.

## 6. Feature(기능)
* 기능 개발시 `./doc/feature/` 폴더에 있는 파일들을 참조한다.
* `feature_1.md`: 보이스를 사용한 상태 체크
* `feature_2.md`: 보이스 메인 설정
* 새로운 기능 추가 시 해당 폴더에 명세서를 작성하고 개발을 진행한다.

## 7. UI Screen 구성
* **HomeScreen (`/`):** 앱의 메인 화면. 설정에 따라 `VoiceMainBody`(음성 인식 중심) 또는 `ManualMainBody`(리스트/버튼 중심)를 표시.
* **SettingsScreen (`/settings`):** 보이스 메인 모드 활성화 여부, 가족 그룹 설정, 알림 설정 등을 관리.
* **HistoryScreen (`/history`):** 과거의 투약, 식사, 운동 기록을 리스트 형태로 확인하고 수정/삭제 가능.
* **CheckItemManagementScreen (`/items`):** 사용자가 직접 관리할 체크 항목(약 이름, 운동 종류 등)을 추가하거나 편집.

## 8. Screen 이동 방식
* 우측 상단에 햄버거 버튼을 배치
* 햄버거 버튼 선택시 우측에서 슬라이드로 이동 가능한 페이지 리스트를 보여줌.
* 리스트에서 페이지 선택시 해당 페이지로 이동
* 모든 페이지는 동일한 방식으로 이동가능

## 9. UI 디자인
* 이 앱의 타겟은 시니어와 그 가족들이나 현재의 노년층은 이전과 달리 스마트폰 사용에 대한 거부감과 어려움이 없음
* 깔끔하고 모던한 느낌의 UI 디자인을 적용.
* 색상은 파란색, 초록색 파스텔톤을 조합하여 적용

## 10. Models
* 모델 생성시 coding_guide.md 를 참조하여 `./doc/models/` 폴더에 있는 파일들을 참조한다.