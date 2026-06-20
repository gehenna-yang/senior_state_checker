// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckItem _$CheckItemFromJson(Map<String, dynamic> json) {
  return _CheckItem.fromJson(json);
}

/// @nodoc
mixin _$CheckItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  CheckType get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  DateTime? get scheduledTime => throw _privateConstructorUsedError;
  DateTime? get startedTime => throw _privateConstructorUsedError; // 운동 시작 시간
  DateTime? get completedTime => throw _privateConstructorUsedError; // 완료 시간
  double get distance => throw _privateConstructorUsedError; // 이동 거리 (km)
  String? get memo => throw _privateConstructorUsedError;
  List<String>? get imageUrls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckItemCopyWith<CheckItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckItemCopyWith<$Res> {
  factory $CheckItemCopyWith(CheckItem value, $Res Function(CheckItem) then) =
      _$CheckItemCopyWithImpl<$Res, CheckItem>;
  @useResult
  $Res call(
      {String id,
      String title,
      CheckType type,
      String? description,
      bool isCompleted,
      DateTime? scheduledTime,
      DateTime? startedTime,
      DateTime? completedTime,
      double distance,
      String? memo,
      List<String>? imageUrls});
}

/// @nodoc
class _$CheckItemCopyWithImpl<$Res, $Val extends CheckItem>
    implements $CheckItemCopyWith<$Res> {
  _$CheckItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? description = freezed,
    Object? isCompleted = null,
    Object? scheduledTime = freezed,
    Object? startedTime = freezed,
    Object? completedTime = freezed,
    Object? distance = null,
    Object? memo = freezed,
    Object? imageUrls = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CheckType,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduledTime: freezed == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedTime: freezed == startedTime
          ? _value.startedTime
          : startedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedTime: freezed == completedTime
          ? _value.completedTime
          : completedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckItemImplCopyWith<$Res>
    implements $CheckItemCopyWith<$Res> {
  factory _$$CheckItemImplCopyWith(
          _$CheckItemImpl value, $Res Function(_$CheckItemImpl) then) =
      __$$CheckItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      CheckType type,
      String? description,
      bool isCompleted,
      DateTime? scheduledTime,
      DateTime? startedTime,
      DateTime? completedTime,
      double distance,
      String? memo,
      List<String>? imageUrls});
}

/// @nodoc
class __$$CheckItemImplCopyWithImpl<$Res>
    extends _$CheckItemCopyWithImpl<$Res, _$CheckItemImpl>
    implements _$$CheckItemImplCopyWith<$Res> {
  __$$CheckItemImplCopyWithImpl(
      _$CheckItemImpl _value, $Res Function(_$CheckItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? description = freezed,
    Object? isCompleted = null,
    Object? scheduledTime = freezed,
    Object? startedTime = freezed,
    Object? completedTime = freezed,
    Object? distance = null,
    Object? memo = freezed,
    Object? imageUrls = freezed,
  }) {
    return _then(_$CheckItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CheckType,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduledTime: freezed == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedTime: freezed == startedTime
          ? _value.startedTime
          : startedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedTime: freezed == completedTime
          ? _value.completedTime
          : completedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckItemImpl implements _CheckItem {
  const _$CheckItemImpl(
      {required this.id,
      required this.title,
      required this.type,
      this.description,
      this.isCompleted = false,
      this.scheduledTime,
      this.startedTime,
      this.completedTime,
      this.distance = 0.0,
      this.memo,
      final List<String>? imageUrls})
      : _imageUrls = imageUrls;

  factory _$CheckItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckItemImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final CheckType type;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  final DateTime? scheduledTime;
  @override
  final DateTime? startedTime;
// 운동 시작 시간
  @override
  final DateTime? completedTime;
// 완료 시간
  @override
  @JsonKey()
  final double distance;
// 이동 거리 (km)
  @override
  final String? memo;
  final List<String>? _imageUrls;
  @override
  List<String>? get imageUrls {
    final value = _imageUrls;
    if (value == null) return null;
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CheckItem(id: $id, title: $title, type: $type, description: $description, isCompleted: $isCompleted, scheduledTime: $scheduledTime, startedTime: $startedTime, completedTime: $completedTime, distance: $distance, memo: $memo, imageUrls: $imageUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.startedTime, startedTime) ||
                other.startedTime == startedTime) &&
            (identical(other.completedTime, completedTime) ||
                other.completedTime == completedTime) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      type,
      description,
      isCompleted,
      scheduledTime,
      startedTime,
      completedTime,
      distance,
      memo,
      const DeepCollectionEquality().hash(_imageUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckItemImplCopyWith<_$CheckItemImpl> get copyWith =>
      __$$CheckItemImplCopyWithImpl<_$CheckItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckItemImplToJson(
      this,
    );
  }
}

abstract class _CheckItem implements CheckItem {
  const factory _CheckItem(
      {required final String id,
      required final String title,
      required final CheckType type,
      final String? description,
      final bool isCompleted,
      final DateTime? scheduledTime,
      final DateTime? startedTime,
      final DateTime? completedTime,
      final double distance,
      final String? memo,
      final List<String>? imageUrls}) = _$CheckItemImpl;

  factory _CheckItem.fromJson(Map<String, dynamic> json) =
      _$CheckItemImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  CheckType get type;
  @override
  String? get description;
  @override
  bool get isCompleted;
  @override
  DateTime? get scheduledTime;
  @override
  DateTime? get startedTime;
  @override // 운동 시작 시간
  DateTime? get completedTime;
  @override // 완료 시간
  double get distance;
  @override // 이동 거리 (km)
  String? get memo;
  @override
  List<String>? get imageUrls;
  @override
  @JsonKey(ignore: true)
  _$$CheckItemImplCopyWith<_$CheckItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
