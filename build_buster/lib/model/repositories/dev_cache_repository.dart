import 'package:build_buster/model/data/dev_project.dart';
import 'package:build_buster/model/data/docker_system_df.dart';
import 'package:build_buster/model/data/gradle_cache.dart';
import 'package:build_buster/model/data/maven_local.dart';
import 'package:build_buster/model/data/npm_cache.dart';
import 'package:build_buster/model/data/pub_cache.dart';
import 'package:build_buster/model/sources/helper_source.dart';
import 'package:flutter/rendering.dart';

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

  Future<bool> deleteGradleCache() {
    return helperSource.deleteGradleCache();
  }

  Future<PubCache> fetchPubCache() {
    return helperSource.fetchPubCache();
  }

  Future<NpmCache> fetchNpmCache() {
    return helperSource.fetchNpmCache();
  }

  Future<bool> deleteNpmCache() {
    return helperSource.deleteNpmCache();
  }

  Future<DevProjectCollection> fetchProjects(String path) {
    return helperSource.fetchProjects(path);
  }

  Future<bool> deleteBuildArtifacts(String projectPath) {
    return helperSource.deleteBuildArtifacts(projectPath);
  }

  Future<bool> deleteAllBuildArtifacts(String path) {
    return helperSource.deleteAllBuildArtifacts(path);
  }

  Future<bool> deletePubCache() {
    return helperSource.deletePubCache();
  }

  Future<bool> deleteDockerCache() {
    return helperSource.deleteDockerCache();
  }

  Future<void> onShutdown() async {
    debugPrint('Shutting down DevCacheRepository...');
    try {
      await helperSource.onShutdown();
    } catch (_) {
      debugPrint('Error during shutdown ignored.');
    }
  }

  Future<bool> isBackendRunning() async {
    try {
      await helperSource.health();
      return true;
    } catch (e) {
      debugPrint('Backend health check failed: $e');
      return false;
    }
  }
}
