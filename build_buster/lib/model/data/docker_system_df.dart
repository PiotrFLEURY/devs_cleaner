import 'package:freezed_annotation/freezed_annotation.dart';

part 'docker_system_df.freezed.dart';
part 'docker_system_df.g.dart';

//{"Active":"0","Reclaimable":"478.9MB (100%)","Size":"478.9MB","TotalCount":"1","Type":"Images"}
//{"Active":"0","Reclaimable":"0B","Size":"0B","TotalCount":"0","Type":"Containers"}
//{"Active":"0","Reclaimable":"260.5MB (100%)","Size":"260.5MB","TotalCount":"3","Type":"Local Volumes"}
//{"Active":"0","Reclaimable":"0B","Size":"0B","TotalCount":"0","Type":"Build Cache"}

@freezed
abstract class DockerSystemDf with _$DockerSystemDf {
  @JsonSerializable(explicitToJson: true)
  const factory DockerSystemDf({
    @JsonKey(name: 'Active') required String active,
    @JsonKey(name: 'Reclaimable') required String reclaimable,
    @JsonKey(name: 'Size') required String size,
    @JsonKey(name: 'TotalCount') required String totalCount,
    @JsonKey(name: 'Type') required String type,
  }) = _DockerSystemDf;

  factory DockerSystemDf.fromJson(Map<String, dynamic> json) =>
      _$DockerSystemDfFromJson(json);
}
