import 'package:freezed_annotation/freezed_annotation.dart';

part 'npm_cache.freezed.dart';
part 'npm_cache.g.dart';

@freezed
abstract class NpmCache with _$NpmCache {
  factory NpmCache({required String path, required double totalSizeInBytes}) =
      _NpmCache;

  factory NpmCache.fromJson(Map<String, dynamic> json) =>
      _$NpmCacheFromJson(json);
}
