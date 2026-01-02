// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backend_status.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BackendStatus)
const backendStatusProvider = BackendStatusProvider._();

final class BackendStatusProvider
    extends $NotifierProvider<BackendStatus, BackendStatusState> {
  const BackendStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'backendStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$backendStatusHash();

  @$internal
  @override
  BackendStatus create() => BackendStatus();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BackendStatusState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BackendStatusState>(value),
    );
  }
}

String _$backendStatusHash() => r'9218cc9dbe8b3a07ad32a78fa945ba41d26510fb';

abstract class _$BackendStatus extends $Notifier<BackendStatusState> {
  BackendStatusState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BackendStatusState, BackendStatusState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BackendStatusState, BackendStatusState>,
              BackendStatusState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
