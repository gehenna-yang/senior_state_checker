# Feature Request: [보이스 메인 설정]

## 1. Objective (목표)
* 앱 구동시 `splash_screen`에서 보이스 관련 권한을 요청하기 위함

## 2. Scope of Work (작업 범위)
* [ ] 앱 구동시 `splash_screen`부터 보여지도록 해야함.
* [ ] 앱 기본 셋팅동안 `splash_screen`에서 앱 이름 **건강 체크** 를 애니메이션 처리해서 보여준다.
* [ ] 앱 기본 셋팅이 완료되면 `home_screen`으로 이동한다.
* [ ] 앱 기본 셋팅에 권한요청 로직을 처리

## 3. Edge Cases & Error Handling (고려할 예외 상황)
* [상황 1] 사용자에게 요청한 권한을 거부한 경우 다른페이지에서 사용자가 권한이 필요한 기능 사용시 다시 권한 요청을 진행하도록 함.

## 4. Implementation Plan (구현 계획)
1. `lib/screens/splash_screen.dart`: 앱 기본 셋팅 및 앱 이름 애니메이션 구현
2. `lib/screens/splash_screen.dart`: 앱 기본 셋팅 완료시 `home_screen`으로 전환 처리
3. `lib/core/services/permission_service.dart`: 마이크 및 음성 인식 권한 요청 로직 구현
4. `lib/screens/home_screen.dart`: 메인 홈 화면 UI 골격 생성

## 5. Verification Plan (검증 계획)
* **UI/UX Test**: 앱 구동시 권한 요청이 정상적으로 나오는지 확인 및 `home_screen`으로 잘 넘어가는지 확인.
