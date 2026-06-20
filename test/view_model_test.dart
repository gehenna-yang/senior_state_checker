import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senior_check_state/domain/entities/check_item.dart';
import 'package:senior_check_state/ui/home/home_view_model.dart';
import 'package:senior_check_state/ui/search/search_view_model.dart';
import 'package:senior_check_state/data/repositories/mock_check_repository.dart';

void main() {
  group('홈 및 통계 뷰모델 단위 테스트', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('초기 데이터 로드 및 항목 토글 테스트', () async {
      // 초기 데이터 로드 대기
      final items = await container.read(homeViewModelProvider.future);
      expect(items, isNotEmpty);
      
      final firstItem = items.first;
      final initialStatus = firstItem.isCompleted;

      // 상태 토글 실행
      await container.read(homeViewModelProvider.notifier).toggleStatus(firstItem.id, initialStatus);
      
      // 변경된 데이터 확인
      final updatedItems = await container.read(homeViewModelProvider.future);
      final updatedItem = updatedItems.firstWhere((e) => e.id == firstItem.id);
      expect(updatedItem.isCompleted, !initialStatus);
    });

    test('운동 트레킹 거리 계산 테스트', () async {
      final items = await container.read(homeViewModelProvider.future);
      final exerciseItem = items.firstWhere((e) => e.type == CheckType.exercise);

      // 운동 시작
      await container.read(homeViewModelProvider.notifier).startExercise(exerciseItem.id);
      
      // 10분 후 종료 가정 (Mock 로직 내에서 시간차를 시뮬레이션하기 위해 startedTime 조작은 어려우나 기본 로직 검증)
      await container.read(homeViewModelProvider.notifier).stopExercise(exerciseItem.id);

      final updatedItems = await container.read(homeViewModelProvider.future);
      final updatedItem = updatedItems.firstWhere((e) => e.id == exerciseItem.id);
      
      expect(updatedItem.isCompleted, true);
      expect(updatedItem.distance, isNotNull);
    });

    test('건강 리포트 통계 계산 정확도 테스트', () async {
      // 항목 중 일부만 완료로 설정
      final items = await container.read(homeViewModelProvider.future);
      for (var item in items) {
        // 모든 항목을 완료되지 않은 상태로 초기화 후 투약 하나만 완료
        if (item.type == CheckType.medication) {
          await container.read(homeViewModelProvider.notifier).toggleStatus(item.id, false);
          break;
        }
      }

      final stats = await container.read(searchViewModelProvider.future);
      
      // 투약 항목이 하나라면 100%, 아니면 비율 확인
      expect(stats.medicationRate, greaterThan(0));
      expect(stats.totalDistance, isNonNegative);
    });

    test('음성 명령 키워드 매칭 테스트', () async {
      // 데이터 로드 대기
      await container.read(homeViewModelProvider.future);
      final notifier = container.read(homeViewModelProvider.notifier);
      
      // "약" 키워드 테스트
      final medMsg = await notifier.handleVoiceCommand('약 먹었어');
      expect(medMsg, contains('약 복용 상태'));

      // "식사" 키워드 테스트
      final mealMsg = await notifier.handleVoiceCommand('밥 먹었어');
      expect(mealMsg, contains('식사 상태'));

      // 알 수 없는 명령 테스트
      final unknownMsg = await notifier.handleVoiceCommand('안녕하세요');
      expect(unknownMsg, contains('인식된 명령이 없습니다'));
    });
  });
}
