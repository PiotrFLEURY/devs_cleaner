import 'package:build_buster/model/data/dev_project.dart';
import 'package:build_buster/model/data/docker_system_df.dart';
import 'package:build_buster/model/data/gradle_cache.dart';
import 'package:build_buster/model/data/maven_local.dart';
import 'package:build_buster/model/data/pub_cache.dart';
import 'package:build_buster/model/sources/helper_source.dart';

class DevCacheRepository {
  DevCacheRepository({required this.helperSource});

  final HelperSource helperSource;

  Future<List<DockerSystemDf>> fetchDockerSystemDf() {
    return helperSource.fetchDockerSystemDf();
  }

  Future<MavenLocal> fetchMavenLocal() {
    return helperSource.fetchMavenLocal();
  }

  Future<bool> deleteMavenLocal() {
    return helperSource.deleteMavenLocal();
  }

  Future<GradleCache> fetchGradleCache() {
    return helperSource.fetchGradleCache();
  }

  Future<PubCache> fetchPubCache() {
    return helperSource.fetchPubCache();
  }

  Future<DevProjectCollection> fetchProjects(String path) {
    return helperSource.fetchProjects(path);
  }

  Future<bool> deleteBuildArtifacts(String projectPath) {
    return helperSource.deleteBuildArtifacts(projectPath);
  }
}
