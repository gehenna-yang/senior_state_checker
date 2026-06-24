// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_check_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StateCheckModel _$StateCheckModelFromJson(Map<String, dynamic> json) {
  return _StateCheckModel.fromJson(json);
}

/// @nodoc
mixin _$StateCheckModel {
  /// 유니크 아이디 (UUID)
  String get id => throw _privateConstructorUsedError;

  /// 생성일시 (체크한 시간)
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// 생성자 아이디
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;

  /// 생성자 닉네임
  @JsonKey(name: 'user_nickname')
  String? get userNickname => throw _privateConstructorUsedError;

  /// 체크한 상태 구분 (예: 통증, 식사, 투약 등)
  String get state => throw _privateConstructorUsedError;

  /// 체크한 상태 구체적 내용
  String get content => throw _privateConstructorUsedError;

  /// 추가 작성된 메모 내용
  String get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateCheckModelCopyWith<StateCheckModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateCheckModelCopyWith<$Res> {
  factory $StateCheckModelCopyWith(
          StateCheckModel value, $Res Function(StateCheckModel) then) =
      _$StateCheckModelCopyWithImpl<$Res, StateCheckModel>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'user_nickname') String? userNickname,
      String state,
      String content,
      String note});
}

/// @nodoc
class _$StateCheckModelCopyWithImpl<$Res, $Val extends StateCheckModel>
    implements $StateCheckModelCopyWith<$Res> {
  _$StateCheckModelCopyWithImpl(this._value, this._then);

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
    Object? state = null,
    Object? content = null,
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
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StateCheckModelImplCopyWith<$Res>
    implements $StateCheckModelCopyWith<$Res> {
  factory _$$StateCheckModelImplCopyWith(_$StateCheckModelImpl value,
          $Res Function(_$StateCheckModelImpl) then) =
      __$$StateCheckModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'user_nickname') String? userNickname,
      String state,
      String content,
      String note});
}

/// @nodoc
class __$$StateCheckModelImplCopyWithImpl<$Res>
    extends _$StateCheckModelCopyWithImpl<$Res, _$StateCheckModelImpl>
    implements _$$StateCheckModelImplCopyWith<$Res> {
  __$$StateCheckModelImplCopyWithImpl(
      _$StateCheckModelImpl _value, $Res Function(_$StateCheckModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? userId = freezed,
    Object? userNickname = freezed,
    Object? state = null,
    Object? content = null,
    Object? note = null,
  }) {
    return _then(_$StateCheckModelImpl(
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
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StateCheckModelImpl implements _StateCheckModel {
  const _$StateCheckModelImpl(
      {required this.id,
      required this.createdAt,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'user_nickname') this.userNickname,
      required this.state,
      this.content = '',
      this.note = ''});

  factory _$StateCheckModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StateCheckModelImplFromJson(json);

  /// 유니크 아이디 (UUID)
  @override
  final String id;

  /// 생성일시 (체크한 시간)
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

  /// 체크한 상태 구분 (예: 통증, 식사, 투약 등)
  @override
  final String state;

  /// 체크한 상태 구체적 내용
  @override
  @JsonKey()
  final String content;

  /// 추가 작성된 메모 내용
  @override
  @JsonKey()
  final String note;

  @override
  String toString() {
    return 'StateCheckModel(id: $id, createdAt: $createdAt, userId: $userId, userNickname: $userNickname, state: $state, content: $content, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateCheckModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userNickname, userNickname) ||
                other.userNickname == userNickname) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, userId, userNickname, state, content, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateCheckModelImplCopyWith<_$StateCheckModelImpl> get copyWith =>
      __$$StateCheckModelImplCopyWithImpl<_$StateCheckModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StateCheckModelImplToJson(
      this,
    );
  }
}

abstract class _StateCheckModel implements StateCheckModel {
  const factory _StateCheckModel(
      {required final String id,
      required final DateTime createdAt,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'user_nickname') final String? userNickname,
      required final String state,
      final String content,
      final String note}) = _$StateCheckModelImpl;

  factory _StateCheckModel.fromJson(Map<String, dynamic> json) =
      _$StateCheckModelImpl.fromJson;

  @override

  /// 유니크 아이디 (UUID)
  String get id;
  @override

  /// 생성일시 (체크한 시간)
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

  /// 체크한 상태 구분 (예: 통증, 식사, 투약 등)
  String get state;
  @override

  /// 체크한 상태 구체적 내용
  String get content;
  @override

  /// 추가 작성된 메모 내용
  String get note;
  @override
  @JsonKey(ignore: true)
  _$$StateCheckModelImplCopyWith<_$StateCheckModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
