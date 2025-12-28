// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npm_cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NpmCache _$NpmCacheFromJson(Map<String, dynamic> json) => _NpmCache(
  path: json['path'] as String,
  totalSizeInBytes: (json['totalSizeInBytes'] as num).toDouble(),
);

Map<String, dynamic> _$NpmCacheToJson(_NpmCache instance) => <String, dynamic>{
  'path': instance.path,
  'totalSizeInBytes': instance.totalSizeInBytes,
};
