// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HealthStats {
  double get medicationRate => throw _privateConstructorUsedError;
  double get mealRate => throw _privateConstructorUsedError;
  double get exerciseRate => throw _privateConstructorUsedError;
  double get totalDistance => throw _privateConstructorUsedError;
  int get totalExerciseMinutes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HealthStatsCopyWith<HealthStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthStatsCopyWith<$Res> {
  factory $HealthStatsCopyWith(
          HealthStats value, $Res Function(HealthStats) then) =
      _$HealthStatsCopyWithImpl<$Res, HealthStats>;
  @useResult
  $Res call(
      {double medicationRate,
      double mealRate,
      double exerciseRate,
      double totalDistance,
      int totalExerciseMinutes});
}

/// @nodoc
class _$HealthStatsCopyWithImpl<$Res, $Val extends HealthStats>
    implements $HealthStatsCopyWith<$Res> {
  _$HealthStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicationRate = null,
    Object? mealRate = null,
    Object? exerciseRate = null,
    Object? totalDistance = null,
    Object? totalExerciseMinutes = null,
  }) {
    return _then(_value.copyWith(
      medicationRate: null == medicationRate
          ? _value.medicationRate
          : medicationRate // ignore: cast_nullable_to_non_nullable
              as double,
      mealRate: null == mealRate
          ? _value.mealRate
          : mealRate // ignore: cast_nullable_to_non_nullable
              as double,
      exerciseRate: null == exerciseRate
          ? _value.exerciseRate
          : exerciseRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalDistance: null == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double,
      totalExerciseMinutes: null == totalExerciseMinutes
          ? _value.totalExerciseMinutes
          : totalExerciseMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthStatsImplCopyWith<$Res>
    implements $HealthStatsCopyWith<$Res> {
  factory _$$HealthStatsImplCopyWith(
          _$HealthStatsImpl value, $Res Function(_$HealthStatsImpl) then) =
      __$$HealthStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double medicationRate,
      double mealRate,
      double exerciseRate,
      double totalDistance,
      int totalExerciseMinutes});
}

/// @nodoc
class __$$HealthStatsImplCopyWithImpl<$Res>
    extends _$HealthStatsCopyWithImpl<$Res, _$HealthStatsImpl>
    implements _$$HealthStatsImplCopyWith<$Res> {
  __$$HealthStatsImplCopyWithImpl(
      _$HealthStatsImpl _value, $Res Function(_$HealthStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicationRate = null,
    Object? mealRate = null,
    Object? exerciseRate = null,
    Object? totalDistance = null,
    Object? totalExerciseMinutes = null,
  }) {
    return _then(_$HealthStatsImpl(
      medicationRate: null == medicationRate
          ? _value.medicationRate
          : medicationRate // ignore: cast_nullable_to_non_nullable
              as double,
      mealRate: null == mealRate
          ? _value.mealRate
          : mealRate // ignore: cast_nullable_to_non_nullable
              as double,
      exerciseRate: null == exerciseRate
          ? _value.exerciseRate
          : exerciseRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalDistance: null == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double,
      totalExerciseMinutes: null == totalExerciseMinutes
          ? _value.totalExerciseMinutes
          : totalExerciseMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HealthStatsImpl implements _HealthStats {
  const _$HealthStatsImpl(
      {required this.medicationRate,
      required this.mealRate,
      required this.exerciseRate,
      required this.totalDistance,
      required this.totalExerciseMinutes});

  @override
  final double medicationRate;
  @override
  final double mealRate;
  @override
  final double exerciseRate;
  @override
  final double totalDistance;
  @override
  final int totalExerciseMinutes;

  @override
  String toString() {
    return 'HealthStats(medicationRate: $medicationRate, mealRate: $mealRate, exerciseRate: $exerciseRate, totalDistance: $totalDistance, totalExerciseMinutes: $totalExerciseMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthStatsImpl &&
            (identical(other.medicationRate, medicationRate) ||
                other.medicationRate == medicationRate) &&
            (identical(other.mealRate, mealRate) ||
                other.mealRate == mealRate) &&
            (identical(other.exerciseRate, exerciseRate) ||
                other.exerciseRate == exerciseRate) &&
            (identical(other.totalDistance, totalDistance) ||
                other.totalDistance == totalDistance) &&
            (identical(other.totalExerciseMinutes, totalExerciseMinutes) ||
                other.totalExerciseMinutes == totalExerciseMinutes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, medicationRate, mealRate,
      exerciseRate, totalDistance, totalExerciseMinutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthStatsImplCopyWith<_$HealthStatsImpl> get copyWith =>
      __$$HealthStatsImplCopyWithImpl<_$HealthStatsImpl>(this, _$identity);
}

abstract class _HealthStats implements HealthStats {
  const factory _HealthStats(
      {required final double medicationRate,
      required final double mealRate,
      required final double exerciseRate,
      required final double totalDistance,
      required final int totalExerciseMinutes}) = _$HealthStatsImpl;

  @override
  double get medicationRate;
  @override
  double get mealRate;
  @override
  double get exerciseRate;
  @override
  double get totalDistance;
  @override
  int get totalExerciseMinutes;
  @override
  @JsonKey(ignore: true)
  _$$HealthStatsImplCopyWith<_$HealthStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
