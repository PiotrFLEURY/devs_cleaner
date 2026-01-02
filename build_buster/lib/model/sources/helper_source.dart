import 'package:build_buster/model/data/dev_project.dart';
import 'package:build_buster/model/data/docker_system_df.dart';
import 'package:build_buster/model/data/gradle_cache.dart';
import 'package:build_buster/model/data/maven_local.dart';
import 'package:build_buster/model/data/npm_cache.dart';
import 'package:build_buster/model/data/pub_cache.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'helper_source.g.dart';

@RestApi(baseUrl: 'http://localhost:3000')
abstract class HelperSource {
  factory HelperSource(Dio dio, {String baseUrl}) = _HelperSource;

  @GET('/dockerCache')
  Future<List<DockerSystemDf>> fetchDockerSystemDf();

  @DELETE('/dockerCache')
  Future<bool> deleteDockerCache();

  @GET('/mavenCache')
  Future<MavenLocal> fetchMavenLocal();

  @DELETE('/mavenCache')
  Future<bool> deleteMavenLocal();

  @GET('/gradleCache')
  Future<GradleCache> fetchGradleCache();

  @DELETE('/gradleCache')
  Future<bool> deleteGradleCache();

  @GET('/pubCache')
  Future<PubCache> fetchPubCache();

  @DELETE('/pubCache')
  Future<bool> deletePubCache();

  @GET('/npmCache')
  Future<NpmCache> fetchNpmCache();

  @DELETE('/npmCache')
  Future<bool> deleteNpmCache();

  @GET('/projects/')
  Future<DevProjectCollection> fetchProjects(@Query("path") String path);

  @DELETE('/projects')
  Future<bool> deleteBuildArtifacts(@Query("projectPath") String projectPath);

  @DELETE('/projects/all')
  Future<bool> deleteAllBuildArtifacts(@Query("path") String path);

  @GET('/shutdown')
  Future<void> onShutdown();

  @GET('/health')
  Future<String> health();
}
