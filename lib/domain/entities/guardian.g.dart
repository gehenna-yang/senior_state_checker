// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guardian.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuardianImpl _$$GuardianImplFromJson(Map<String, dynamic> json) =>
    _$GuardianImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      relationship: json['relationship'] as String,
      isSharingEnabled: json['isSharingEnabled'] as bool? ?? true,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$GuardianImplToJson(_$GuardianImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'relationship': instance.relationship,
      'isSharingEnabled': instance.isSharingEnabled,
      'phoneNumber': instance.phoneNumber,
    };
