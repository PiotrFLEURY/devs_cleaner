// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maven_local_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mavenLocal)
const mavenLocalProvider = MavenLocalProvider._();

final class MavenLocalProvider
    extends
        $FunctionalProvider<
          AsyncValue<MavenLocal>,
          MavenLocal,
          FutureOr<MavenLocal>
        >
    with $FutureModifier<MavenLocal>, $FutureProvider<MavenLocal> {
  const MavenLocalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mavenLocalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mavenLocalHash();

  @$internal
  @override
  $FutureProviderElement<MavenLocal> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<MavenLocal> create(Ref ref) {
    return mavenLocal(ref);
  }
}

String _$mavenLocalHash() => r'50837db7dad7b1a93a9f55486ecec26208f8ec9c';
