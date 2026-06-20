import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_provider.g.dart';

enum FontScale {
  normal(1.0, '보통'),
  large(1.2, '크게'),
  extraLarge(1.5, '아주 크게');

  final double scale;
  final String label;
  const FontScale(this.scale, this.label);
}

class SettingsState {
  final bool isHighContrast;
  final FontScale fontScale;

  SettingsState({
    required this.isHighContrast,
    required this.fontScale,
  });

  SettingsState copyWith({
    bool? isHighContrast,
    FontScale? fontScale,
  }) {
    return SettingsState(
      isHighContrast: isHighContrast ?? this.isHighContrast,
      fontScale: fontScale ?? this.fontScale,
    );
  }
}

@riverpod
class Settings extends _$Settings {
  static const _keyHighContrast = 'is_high_contrast';
  static const _keyFontScale = 'font_scale_index';

  @override
  SettingsState build() {
    // 초기 상태는 기본값으로 시작하고, build() 내에서 로드하는 대신
    // 외부에서 로드하거나 FutureProvider를 고려할 수 있으나
    // 여기서는 동기적으로 리턴하고 나중에 로드 로직을 추가합니다.
    return SettingsState(
      isHighContrast: false,
      fontScale: FontScale.normal,
    );
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final isHC = prefs.getBool(_keyHighContrast) ?? false;
    final fsIndex = prefs.getInt(_keyFontScale) ?? 0;
    
    state = SettingsState(
      isHighContrast: isHC,
      fontScale: FontScale.values[fsIndex],
    );
  }

  Future<void> toggleHighContrast() async {
    final newVal = !state.isHighContrast;
    state = state.copyWith(isHighContrast: newVal);
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyHighContrast, newVal);
  }

  Future<void> setFontScale(FontScale scale) async {
    state = state.copyWith(fontScale: scale);
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyFontScale, scale.index);
  }
}
