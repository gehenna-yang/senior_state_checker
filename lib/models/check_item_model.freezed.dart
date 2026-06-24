// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckItemModel _$CheckItemModelFromJson(Map<String, dynamic> json) {
  return _CheckItemModel.fromJson(json);
}

/// @nodoc
mixin _$CheckItemModel {
  /// 유니크 아이디 (UUID)
  String get id => throw _privateConstructorUsedError;

  /// 생성일시
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// 생성자 아이디
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;

  /// 생성자 닉네임
  @JsonKey(name: 'user_nickname')
  String? get userNickname => throw _privateConstructorUsedError;

  /// 상태 타입 (예: PAIN_CHECK, MEDICATION_CHECK 등)
  String get type => throw _privateConstructorUsedError;

  /// 상세 입력 항목 리스트
  @JsonKey(name: 'item')
  List<String> get items => throw _privateConstructorUsedError;

  /// 추가 작성된 메모 내용
  String get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckItemModelCopyWith<CheckItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckItemModelCopyWith<$Res> {
  factory $CheckItemModelCopyWith(
          CheckItemModel value, $Res Function(CheckItemModel) then) =
      _$CheckItemModelCopyWithImpl<$Res, CheckItemModel>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'user_nickname') String? userNickname,
      String type,
      @JsonKey(name: 'item') List<String> items,
      String note});
}

/// @nodoc
class _$CheckItemModelCopyWithImpl<$Res, $Val extends CheckItemModel>
    implements $CheckItemModelCopyWith<$Res> {
  _$CheckItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? userId = freezed,
    Object? userNickname = freezed,
    Object? type = null,
    Object? items = null,
    Object? note = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userNickname: freezed == userNickname
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckItemModelImplCopyWith<$Res>
    implements $CheckItemModelCopyWith<$Res> {
  factory _$$CheckItemModelImplCopyWith(_$CheckItemModelImpl value,
          $Res Function(_$CheckItemModelImpl) then) =
      __$$CheckItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'user_nickname') String? userNickname,
      String type,
      @JsonKey(name: 'item') List<String> items,
      String note});
}

/// @nodoc
class __$$CheckItemModelImplCopyWithImpl<$Res>
    extends _$CheckItemModelCopyWithImpl<$Res, _$CheckItemModelImpl>
    implements _$$CheckItemModelImplCopyWith<$Res> {
  __$$CheckItemModelImplCopyWithImpl(
      _$CheckItemModelImpl _value, $Res Function(_$CheckItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? userId = freezed,
    Object? userNickname = freezed,
    Object? type = null,
    Object? items = null,
    Object? note = null,
  }) {
    return _then(_$CheckItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userNickname: freezed == userNickname
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckItemModelImpl implements _CheckItemModel {
  const _$CheckItemModelImpl(
      {required this.id,
      required this.createdAt,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'user_nickname') this.userNickname,
      required this.type,
      @JsonKey(name: 'item') final List<String> items = const [],
      this.note = ''})
      : _items = items;

  factory _$CheckItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckItemModelImplFromJson(json);

  /// 유니크 아이디 (UUID)
  @override
  final String id;

  /// 생성일시
  @override
  final DateTime createdAt;

  /// 생성자 아이디
  @override
  @JsonKey(name: 'user_id')
  final String? userId;

  /// 생성자 닉네임
  @override
  @JsonKey(name: 'user_nickname')
  final String? userNickname;

  /// 상태 타입 (예: PAIN_CHECK, MEDICATION_CHECK 등)
  @override
  final String type;

  /// 상세 입력 항목 리스트
  final List<String> _items;

  /// 상세 입력 항목 리스트
  @override
  @JsonKey(name: 'item')
  List<String> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// 추가 작성된 메모 내용
  @override
  @JsonKey()
  final String note;

  @override
  String toString() {
    return 'CheckItemModel(id: $id, createdAt: $createdAt, userId: $userId, userNickname: $userNickname, type: $type, items: $items, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userNickname, userNickname) ||
                other.userNickname == userNickname) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, userId,
      userNickname, type, const DeepCollectionEquality().hash(_items), note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckItemModelImplCopyWith<_$CheckItemModelImpl> get copyWith =>
      __$$CheckItemModelImplCopyWithImpl<_$CheckItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckItemModelImplToJson(
      this,
    );
  }
}

abstract class _CheckItemModel implements CheckItemModel {
  const factory _CheckItemModel(
      {required final String id,
      required final DateTime createdAt,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'user_nickname') final String? userNickname,
      required final String type,
      @JsonKey(name: 'item') final List<String> items,
      final String note}) = _$CheckItemModelImpl;

  factory _CheckItemModel.fromJson(Map<String, dynamic> json) =
      _$CheckItemModelImpl.fromJson;

  @override

  /// 유니크 아이디 (UUID)
  String get id;
  @override

  /// 생성일시
  DateTime get createdAt;
  @override

  /// 생성자 아이디
  @JsonKey(name: 'user_id')
  String? get userId;
  @override

  /// 생성자 닉네임
  @JsonKey(name: 'user_nickname')
  String? get userNickname;
  @override

  /// 상태 타입 (예: PAIN_CHECK, MEDICATION_CHECK 등)
  String get type;
  @override

  /// 상세 입력 항목 리스트
  @JsonKey(name: 'item')
  List<String> get items;
  @override

  /// 추가 작성된 메모 내용
  String get note;
  @override
  @JsonKey(ignore: true)
  _$$CheckItemModelImplCopyWith<_$CheckItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
