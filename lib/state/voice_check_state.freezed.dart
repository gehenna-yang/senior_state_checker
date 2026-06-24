// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_check_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VoiceCheckState {
  /// 현재 음성 인식의 진행 상태
  VoiceStatus get status => throw _privateConstructorUsedError;

  /// 인식된 텍스트 결과
  String get recognizedText => throw _privateConstructorUsedError;

  /// 보이스 모드가 메인인지 여부 (Feature 2 핵심 설정)
  bool get isVoiceMainMode => throw _privateConstructorUsedError;

  /// 화면에 표시할 에러 메시지
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VoiceCheckStateCopyWith<VoiceCheckState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceCheckStateCopyWith<$Res> {
  factory $VoiceCheckStateCopyWith(
          VoiceCheckState value, $Res Function(VoiceCheckState) then) =
      _$VoiceCheckStateCopyWithImpl<$Res, VoiceCheckState>;
  @useResult
  $Res call(
      {VoiceStatus status,
      String recognizedText,
      bool isVoiceMainMode,
      String? errorMessage});
}

/// @nodoc
class _$VoiceCheckStateCopyWithImpl<$Res, $Val extends VoiceCheckState>
    implements $VoiceCheckStateCopyWith<$Res> {
  _$VoiceCheckStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? recognizedText = null,
    Object? isVoiceMainMode = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VoiceStatus,
      recognizedText: null == recognizedText
          ? _value.recognizedText
          : recognizedText // ignore: cast_nullable_to_non_nullable
              as String,
      isVoiceMainMode: null == isVoiceMainMode
          ? _value.isVoiceMainMode
          : isVoiceMainMode // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoiceCheckStateImplCopyWith<$Res>
    implements $VoiceCheckStateCopyWith<$Res> {
  factory _$$VoiceCheckStateImplCopyWith(_$VoiceCheckStateImpl value,
          $Res Function(_$VoiceCheckStateImpl) then) =
      __$$VoiceCheckStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VoiceStatus status,
      String recognizedText,
      bool isVoiceMainMode,
      String? errorMessage});
}

/// @nodoc
class __$$VoiceCheckStateImplCopyWithImpl<$Res>
    extends _$VoiceCheckStateCopyWithImpl<$Res, _$VoiceCheckStateImpl>
    implements _$$VoiceCheckStateImplCopyWith<$Res> {
  __$$VoiceCheckStateImplCopyWithImpl(
      _$VoiceCheckStateImpl _value, $Res Function(_$VoiceCheckStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? recognizedText = null,
    Object? isVoiceMainMode = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$VoiceCheckStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VoiceStatus,
      recognizedText: null == recognizedText
          ? _value.recognizedText
          : recognizedText // ignore: cast_nullable_to_non_nullable
              as String,
      isVoiceMainMode: null == isVoiceMainMode
          ? _value.isVoiceMainMode
          : isVoiceMainMode // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VoiceCheckStateImpl implements _VoiceCheckState {
  const _$VoiceCheckStateImpl(
      {this.status = VoiceStatus.idle,
      this.recognizedText = '',
      this.isVoiceMainMode = true,
      this.errorMessage});

  /// 현재 음성 인식의 진행 상태
  @override
  @JsonKey()
  final VoiceStatus status;

  /// 인식된 텍스트 결과
  @override
  @JsonKey()
  final String recognizedText;

  /// 보이스 모드가 메인인지 여부 (Feature 2 핵심 설정)
  @override
  @JsonKey()
  final bool isVoiceMainMode;

  /// 화면에 표시할 에러 메시지
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'VoiceCheckState(status: $status, recognizedText: $recognizedText, isVoiceMainMode: $isVoiceMainMode, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceCheckStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.recognizedText, recognizedText) ||
                other.recognizedText == recognizedText) &&
            (identical(other.isVoiceMainMode, isVoiceMainMode) ||
                other.isVoiceMainMode == isVoiceMainMode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, recognizedText, isVoiceMainMode, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceCheckStateImplCopyWith<_$VoiceCheckStateImpl> get copyWith =>
      __$$VoiceCheckStateImplCopyWithImpl<_$VoiceCheckStateImpl>(
          this, _$identity);
}

abstract class _VoiceCheckState implements VoiceCheckState {
  const factory _VoiceCheckState(
      {final VoiceStatus status,
      final String recognizedText,
      final bool isVoiceMainMode,
      final String? errorMessage}) = _$VoiceCheckStateImpl;

  @override

  /// 현재 음성 인식의 진행 상태
  VoiceStatus get status;
  @override

  /// 인식된 텍스트 결과
  String get recognizedText;
  @override

  /// 보이스 모드가 메인인지 여부 (Feature 2 핵심 설정)
  bool get isVoiceMainMode;
  @override

  /// 화면에 표시할 에러 메시지
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$VoiceCheckStateImplCopyWith<_$VoiceCheckStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
