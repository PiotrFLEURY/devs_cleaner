// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maven_local.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MavenLocal _$MavenLocalFromJson(Map<String, dynamic> json) => _MavenLocal(
  path: json['path'] as String,
  totalSizeInBytes: (json['totalSizeInBytes'] as num).toDouble(),
);

Map<String, dynamic> _$MavenLocalToJson(_MavenLocal instance) =>
    <String, dynamic>{
      'path': instance.path,
      'totalSizeInBytes': instance.totalSizeInBytes,
    };
