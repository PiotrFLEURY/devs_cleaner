// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helper_source_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(helperSource)
const helperSourceProvider = HelperSourceProvider._();

final class HelperSourceProvider
    extends $FunctionalProvider<HelperSource, HelperSource, HelperSource>
    with $Provider<HelperSource> {
  const HelperSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'helperSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$helperSourceHash();

  @$internal
  @override
  $ProviderElement<HelperSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HelperSource create(Ref ref) {
    return helperSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HelperSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HelperSource>(value),
    );
  }
}

String _$helperSourceHash() => r'4866b723f7625faaf52152e503db915ae2d7e589';
