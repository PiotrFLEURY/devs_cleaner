// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dev_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DevProject _$DevProjectFromJson(Map<String, dynamic> json) => _DevProject(
  path: json['path'] as String,
  technology: json['technology'] as String,
  sizeInBytes: (json['sizeInBytes'] as num).toDouble(),
);

Map<String, dynamic> _$DevProjectToJson(_DevProject instance) =>
    <String, dynamic>{
      'path': instance.path,
      'technology': instance.technology,
      'sizeInBytes': instance.sizeInBytes,
    };

_DevProjectCollection _$DevProjectCollectionFromJson(
  Map<String, dynamic> json,
) => _DevProjectCollection(
  projects: (json['projects'] as List<dynamic>)
      .map((e) => DevProject.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DevProjectCollectionToJson(
  _DevProjectCollection instance,
) => <String, dynamic>{'projects': instance.projects};
