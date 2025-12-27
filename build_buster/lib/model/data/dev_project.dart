import 'package:freezed_annotation/freezed_annotation.dart';

part 'dev_project.freezed.dart';
part 'dev_project.g.dart';

@freezed
abstract class DevProject with _$DevProject {
  const factory DevProject({
    required String path,
    required String technology,
    required double sizeInBytes,
    required bool hasBuildArtifact,
  }) = _DevProject;

  factory DevProject.fromJson(Map<String, dynamic> json) =>
      _$DevProjectFromJson(json);
}

@freezed
abstract class DevProjectCollection with _$DevProjectCollection {
  const factory DevProjectCollection({required List<DevProject> projects}) =
      _DevProjectCollection;

  factory DevProjectCollection.fromJson(Map<String, dynamic> json) =>
      _$DevProjectCollectionFromJson(json);
}
