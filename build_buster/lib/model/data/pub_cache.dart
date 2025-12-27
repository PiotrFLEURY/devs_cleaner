import 'package:freezed_annotation/freezed_annotation.dart';

part 'pub_cache.freezed.dart';
part 'pub_cache.g.dart';

@freezed
abstract class PubCache with _$PubCache {
  const factory PubCache({
    required String path,
    required double totalSizeInBytes,
  }) = _PubCache;

  factory PubCache.fromJson(Map<String, dynamic> json) =>
      _$PubCacheFromJson(json);
}
