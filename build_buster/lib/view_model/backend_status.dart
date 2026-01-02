import 'package:build_buster/helper.dart';
import 'package:build_buster/view_model/providers/dev_cache_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backend_status.g.dart';

enum BackendStatusState { starting, running, stopping, stopped, unknown }

@riverpod
class BackendStatus extends _$BackendStatus {
  @override
  BackendStatusState build() {
    checkStatus();
    // Initial state is unknown
    return BackendStatusState.unknown;
  }

  Future<void> checkStatus() async {
    final repository = ref.read(devCacheRepositoryProvider);
    final isRunning = await repository.isBackendRunning();
    if (isRunning) {
      state = BackendStatusState.running;
    } else {
      state = BackendStatusState.stopped;
    }
  }

  Future<void> startBackend() async {
    state = BackendStatusState.starting;
    await startServer();
    await Future.delayed(const Duration(seconds: 1));
    await checkStatus();
  }

  Future<void> stopBackend() async {
    state = BackendStatusState.stopping;
    final repository = ref.read(devCacheRepositoryProvider);
    await repository.onShutdown();
    await Future.delayed(const Duration(seconds: 1));
    await checkStatus();
  }

  Future<void> toggleBackend() async {
    await checkStatus();

    if (state == BackendStatusState.running) {
      stopBackend();
    } else if (state == BackendStatusState.stopped) {
      startBackend();
    }
  }
}
