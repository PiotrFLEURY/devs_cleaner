// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'docker_system_df.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DockerSystemDf _$DockerSystemDfFromJson(Map<String, dynamic> json) =>
    _DockerSystemDf(
      active: json['Active'] as String,
      reclaimable: json['Reclaimable'] as String,
      size: json['Size'] as String,
      totalCount: json['TotalCount'] as String,
      type: json['Type'] as String,
    );

Map<String, dynamic> _$DockerSystemDfToJson(_DockerSystemDf instance) =>
    <String, dynamic>{
      'Active': instance.active,
      'Reclaimable': instance.reclaimable,
      'Size': instance.size,
      'TotalCount': instance.totalCount,
      'Type': instance.type,
    };
