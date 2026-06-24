// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckItemModelImpl _$$CheckItemModelImplFromJson(Map<String, dynamic> json) =>
    _$CheckItemModelImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      userId: json['user_id'] as String?,
      userNickname: json['user_nickname'] as String?,
      type: json['type'] as String,
      items:
          (json['item'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$$CheckItemModelImplToJson(
        _$CheckItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'user_id': instance.userId,
      'user_nickname': instance.userNickname,
      'type': instance.type,
      'item': instance.items,
      'note': instance.note,
    };
