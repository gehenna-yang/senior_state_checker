// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckItemImpl _$$CheckItemImplFromJson(Map<String, dynamic> json) =>
    _$CheckItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      type: $enumDecode(_$CheckTypeEnumMap, json['type']),
      description: json['description'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
      scheduledTime: json['scheduledTime'] == null
          ? null
          : DateTime.parse(json['scheduledTime'] as String),
      startedTime: json['startedTime'] == null
          ? null
          : DateTime.parse(json['startedTime'] as String),
      completedTime: json['completedTime'] == null
          ? null
          : DateTime.parse(json['completedTime'] as String),
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
      memo: json['memo'] as String?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CheckItemImplToJson(_$CheckItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$CheckTypeEnumMap[instance.type]!,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'scheduledTime': instance.scheduledTime?.toIso8601String(),
      'startedTime': instance.startedTime?.toIso8601String(),
      'completedTime': instance.completedTime?.toIso8601String(),
      'distance': instance.distance,
      'memo': instance.memo,
      'imageUrls': instance.imageUrls,
    };

const _$CheckTypeEnumMap = {
  CheckType.medication: 'medication',
  CheckType.meal: 'meal',
  CheckType.exercise: 'exercise',
};
