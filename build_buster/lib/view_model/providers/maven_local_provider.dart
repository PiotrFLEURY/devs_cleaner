import 'package:build_buster/model/data/maven_local.dart';
import 'package:build_buster/view_model/providers/dev_cache_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'maven_local_provider.g.dart';

@riverpod
Future<MavenLocal> mavenLocal(Ref ref) {
  final devCacheRepository = ref.watch(devCacheRepositoryProvider);
  return devCacheRepository.fetchMavenLocal();
}
