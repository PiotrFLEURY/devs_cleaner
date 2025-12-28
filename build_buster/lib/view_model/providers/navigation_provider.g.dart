// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Navigation)
const navigationProvider = NavigationProvider._();

final class NavigationProvider
    extends $NotifierProvider<Navigation, NavigationItem> {
  const NavigationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigationHash();

  @$internal
  @override
  Navigation create() => Navigation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NavigationItem value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NavigationItem>(value),
    );
  }
}

String _$navigationHash() => r'9975be4757ce9337158a51de2ad14ef4367bf84b';

abstract class _$Navigation extends $Notifier<NavigationItem> {
  NavigationItem build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<NavigationItem, NavigationItem>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NavigationItem, NavigationItem>,
              NavigationItem,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
