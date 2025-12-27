// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradle_cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GradleCache _$GradleCacheFromJson(Map<String, dynamic> json) => _GradleCache(
  path: json['path'] as String,
  totalSizeInBytes: (json['totalSizeInBytes'] as num).toDouble(),
);

Map<String, dynamic> _$GradleCacheToJson(_GradleCache instance) =>
    <String, dynamic>{
      'path': instance.path,
      'totalSizeInBytes': instance.totalSizeInBytes,
    };
