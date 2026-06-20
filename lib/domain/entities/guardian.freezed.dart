// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guardian.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Guardian _$GuardianFromJson(Map<String, dynamic> json) {
  return _Guardian.fromJson(json);
}

/// @nodoc
mixin _$Guardian {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get relationship =>
      throw _privateConstructorUsedError; // 예: 아들, 딸, 배우자
  bool get isSharingEnabled => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuardianCopyWith<Guardian> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuardianCopyWith<$Res> {
  factory $GuardianCopyWith(Guardian value, $Res Function(Guardian) then) =
      _$GuardianCopyWithImpl<$Res, Guardian>;
  @useResult
  $Res call(
      {String id,
      String name,
      String relationship,
      bool isSharingEnabled,
      String? phoneNumber});
}

/// @nodoc
class _$GuardianCopyWithImpl<$Res, $Val extends Guardian>
    implements $GuardianCopyWith<$Res> {
  _$GuardianCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? relationship = null,
    Object? isSharingEnabled = null,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      relationship: null == relationship
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String,
      isSharingEnabled: null == isSharingEnabled
          ? _value.isSharingEnabled
          : isSharingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuardianImplCopyWith<$Res>
    implements $GuardianCopyWith<$Res> {
  factory _$$GuardianImplCopyWith(
          _$GuardianImpl value, $Res Function(_$GuardianImpl) then) =
      __$$GuardianImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String relationship,
      bool isSharingEnabled,
      String? phoneNumber});
}

/// @nodoc
class __$$GuardianImplCopyWithImpl<$Res>
    extends _$GuardianCopyWithImpl<$Res, _$GuardianImpl>
    implements _$$GuardianImplCopyWith<$Res> {
  __$$GuardianImplCopyWithImpl(
      _$GuardianImpl _value, $Res Function(_$GuardianImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? relationship = null,
    Object? isSharingEnabled = null,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$GuardianImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      relationship: null == relationship
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String,
      isSharingEnabled: null == isSharingEnabled
          ? _value.isSharingEnabled
          : isSharingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuardianImpl implements _Guardian {
  const _$GuardianImpl(
      {required this.id,
      required this.name,
      required this.relationship,
      this.isSharingEnabled = true,
      this.phoneNumber});

  factory _$GuardianImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuardianImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String relationship;
// 예: 아들, 딸, 배우자
  @override
  @JsonKey()
  final bool isSharingEnabled;
  @override
  final String? phoneNumber;

  @override
  String toString() {
    return 'Guardian(id: $id, name: $name, relationship: $relationship, isSharingEnabled: $isSharingEnabled, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuardianImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.relationship, relationship) ||
                other.relationship == relationship) &&
            (identical(other.isSharingEnabled, isSharingEnabled) ||
                other.isSharingEnabled == isSharingEnabled) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, relationship, isSharingEnabled, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GuardianImplCopyWith<_$GuardianImpl> get copyWith =>
      __$$GuardianImplCopyWithImpl<_$GuardianImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuardianImplToJson(
      this,
    );
  }
}

abstract class _Guardian implements Guardian {
  const factory _Guardian(
      {required final String id,
      required final String name,
      required final String relationship,
      final bool isSharingEnabled,
      final String? phoneNumber}) = _$GuardianImpl;

  factory _Guardian.fromJson(Map<String, dynamic> json) =
      _$GuardianImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get relationship;
  @override // 예: 아들, 딸, 배우자
  bool get isSharingEnabled;
  @override
  String? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$GuardianImplCopyWith<_$GuardianImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
