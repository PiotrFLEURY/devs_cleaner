import 'package:build_buster/model/data/dev_project.dart';
import 'package:build_buster/model/data/docker_system_df.dart';
import 'package:build_buster/model/data/gradle_cache.dart';
import 'package:build_buster/model/data/maven_local.dart';
import 'package:build_buster/model/data/pub_cache.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'helper_source.g.dart';

@RestApi(baseUrl: 'http://localhost:3000')
abstract class HelperSource {
  factory HelperSource(Dio dio, {String baseUrl}) = _HelperSource;

  @GET('/dockerCache')
  Future<List<DockerSystemDf>> fetchDockerSystemDf();

  @GET('/mavenCache')
  Future<MavenLocal> fetchMavenLocal();

  @GET('/gradleCache')
  Future<GradleCache> fetchGradleCache();

  @GET('/pubCache')
  Future<PubCache> fetchPubCache();

  @GET('/projects/{path}')
  Future<DevProjectCollection> fetchProjects(@Path("path") String path);
}
