import 'package:freezed_annotation/freezed_annotation.dart';

part 'maven_local.freezed.dart';
part 'maven_local.g.dart';

@freezed
abstract class MavenLocal with _$MavenLocal {
  const factory MavenLocal({
    required String path,
    required double totalSizeInBytes,
  }) = _MavenLocal;

  factory MavenLocal.fromJson(Map<String, dynamic> json) =>
      _$MavenLocalFromJson(json);
}
