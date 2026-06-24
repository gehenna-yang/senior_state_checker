// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      password: json['password'] as String,
      nickname: json['nickname'] as String,
      position: json['position'] as String? ?? 'general',
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'password': instance.password,
      'nickname': instance.nickname,
      'position': instance.position,
      'note': instance.note,
    };
