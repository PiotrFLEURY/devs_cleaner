import 'package:build_buster/model/repositories/dev_cache_repository.dart';
import 'package:build_buster/view_model/providers/helper_source_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dev_cache_repository_provider.g.dart';

@riverpod
DevCacheRepository devCacheRepository(Ref ref) {
  final helperSource = ref.watch(helperSourceProvider);
  return DevCacheRepository(helperSource: helperSource);
}
