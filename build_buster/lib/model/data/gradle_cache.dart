import 'package:freezed_annotation/freezed_annotation.dart';

part 'gradle_cache.freezed.dart';
part 'gradle_cache.g.dart';

@freezed
abstract class GradleCache with _$GradleCache {
  const factory GradleCache({
    required String path,
    required double totalSizeInBytes,
  }) = _GradleCache;
  factory GradleCache.fromJson(Map<String, dynamic> json) =>
      _$GradleCacheFromJson(json);
}
