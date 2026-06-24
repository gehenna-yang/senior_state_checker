// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StateCheckModelImpl _$$StateCheckModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StateCheckModelImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      userId: json['user_id'] as String?,
      userNickname: json['user_nickname'] as String?,
      state: json['state'] as String,
      content: json['content'] as String? ?? '',
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$$StateCheckModelImplToJson(
        _$StateCheckModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'user_id': instance.userId,
      'user_nickname': instance.userNickname,
      'state': instance.state,
      'content': instance.content,
      'note': instance.note,
    };
