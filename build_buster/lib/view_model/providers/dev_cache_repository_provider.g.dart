// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dev_cache_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(devCacheRepository)
const devCacheRepositoryProvider = DevCacheRepositoryProvider._();

final class DevCacheRepositoryProvider
    extends
        $FunctionalProvider<
          DevCacheRepository,
          DevCacheRepository,
          DevCacheRepository
        >
    with $Provider<DevCacheRepository> {
  const DevCacheRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'devCacheRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$devCacheRepositoryHash();

  @$internal
  @override
  $ProviderElement<DevCacheRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DevCacheRepository create(Ref ref) {
    return devCacheRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DevCacheRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DevCacheRepository>(value),
    );
  }
}

String _$devCacheRepositoryHash() =>
    r'e3de673193c0b2b2e660ecdb7f95bf5eb012b3e5';
