import 'package:build_buster/model/data/dev_project.dart';
import 'package:build_buster/model/data/docker_system_df.dart';
import 'package:build_buster/model/data/gradle_cache.dart';
import 'package:build_buster/model/data/maven_local.dart';
import 'package:build_buster/model/data/pub_cache.dart';
import 'package:build_buster/view_model/providers/dev_cache_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_view_model.g.dart';

class DockerSystemDfWrapper {
  DockerSystemDfWrapper({required this.dockerSystemDf});

  final List<DockerSystemDf> dockerSystemDf;

  double get totalSizeInBytes {
    return dockerSystemDf.fold(0, (sum, df) => sum + _parseInBytes(df.size));
  }

  double get totalDockerCacheSizeInGb {
    return totalSizeInBytes / 1e9;
  }

  int _parseInBytes(String sizeStr) {
    if (sizeStr.endsWith('GB')) {
      return (double.parse(sizeStr.replaceAll('GB', '').trim()) * 1e9).toInt();
    } else if (sizeStr.endsWith('MB')) {
      return (double.parse(sizeStr.replaceAll('MB', '').trim()) * 1e6).toInt();
    } else if (sizeStr.endsWith('KB')) {
      return (double.parse(sizeStr.replaceAll('KB', '').trim()) * 1e3).toInt();
    } else {
      return 0;
    }
  }
}

class HomePageState {
  HomePageState({
    required this.dockerSystemDf,
    required this.mavenLocal,
    required this.gradleCache,
    required this.pubCache,
    required this.projectsPath,
    required this.projectCollection,
  });

  factory HomePageState.empty() {
    return HomePageState(
      dockerSystemDf: DockerSystemDfWrapper(dockerSystemDf: []),
      mavenLocal: MavenLocal(path: '', totalSizeInBytes: 0),
      gradleCache: GradleCache(path: '', totalSizeInBytes: 0),
      pubCache: PubCache(path: '', totalSizeInBytes: 0),
      projectsPath: '',
      projectCollection: DevProjectCollection(projects: []),
    );
  }

  HomePageState copyWith({
    DockerSystemDfWrapper? dockerSystemDf,
    MavenLocal? mavenLocal,
    GradleCache? gradleCache,
    PubCache? pubCache,
    String? projectsPath,
    DevProjectCollection? projectCollection,
  }) {
    return HomePageState(
      dockerSystemDf: dockerSystemDf ?? this.dockerSystemDf,
      mavenLocal: mavenLocal ?? this.mavenLocal,
      gradleCache: gradleCache ?? this.gradleCache,
      pubCache: pubCache ?? this.pubCache,
      projectsPath: projectsPath ?? this.projectsPath,
      projectCollection: projectCollection ?? this.projectCollection,
    );
  }

  DockerSystemDfWrapper dockerSystemDf;
  MavenLocal mavenLocal;
  GradleCache gradleCache;
  PubCache pubCache;
  String projectsPath = '';
  DevProjectCollection projectCollection;

  List<DevProject> get sortedDevProjects {
    final projects = List<DevProject>.from(projectCollection.projects);
    projects.sort((a, b) => b.sizeInBytes.compareTo(a.sizeInBytes));
    return projects;
  }

  String toFormattedString(double sizeInBytes) {
    if (sizeInBytes >= 1e9) {
      return '${(sizeInBytes / 1e9).toStringAsFixed(2)} GB';
    } else if (sizeInBytes >= 1e6) {
      return '${(sizeInBytes / 1e6).toStringAsFixed(2)} MB';
    } else if (sizeInBytes >= 1e3) {
      return '${(sizeInBytes / 1e3).toStringAsFixed(2)} KB';
    } else {
      return '$sizeInBytes B';
    }
  }

  String dockerCacheToFormattedString() {
    return toFormattedString(dockerSystemDf.totalSizeInBytes);
  }

  String mavenLocalToFormattedString() {
    return toFormattedString(mavenLocal.totalSizeInBytes);
  }

  String gradleCacheToFormattedString() {
    return toFormattedString(gradleCache.totalSizeInBytes);
  }

  String pubCacheToFormattedString() {
    return toFormattedString(pubCache.totalSizeInBytes);
  }

  double get totalMavenCacheSizeInGb {
    return mavenLocal.totalSizeInBytes / 1e9;
  }

  double get totalGradleCacheSizeInGb {
    return gradleCache.totalSizeInBytes / 1e9;
  }

  double get totalPubCacheSizeInGb {
    return pubCache.totalSizeInBytes / 1e9;
  }

  double get totalSizeUsedInGb {
    return dockerSystemDf.totalDockerCacheSizeInGb +
        totalMavenCacheSizeInGb +
        totalGradleCacheSizeInGb +
        totalPubCacheSizeInGb;
  }

  double get dockerPercentageUsed {
    // percentage used by docker compared to total size used
    if (totalSizeUsedInGb == 0) return 0;
    return ((dockerSystemDf.totalDockerCacheSizeInGb / totalSizeUsedInGb) * 100)
        .roundToDouble();
  }

  double get mavenPercentageUsed {
    // percentage used by maven compared to total size used
    if (totalSizeUsedInGb == 0) return 0;
    return ((totalMavenCacheSizeInGb / totalSizeUsedInGb) * 100)
        .roundToDouble();
  }

  double get gradlePercentageUsed {
    // percentage used by gradle compared to total size used
    if (totalSizeUsedInGb == 0) return 0;
    return ((totalGradleCacheSizeInGb / totalSizeUsedInGb) * 100)
        .roundToDouble();
  }

  double get pubPercentageUsed {
    // percentage used by pub compared to total size used
    if (totalSizeUsedInGb == 0) return 0;
    return ((totalPubCacheSizeInGb / totalSizeUsedInGb) * 100).roundToDouble();
  }

  double get totalProjectSizeInBytes => projectCollection.projects.fold(
    0,
    (sum, project) => sum + project.sizeInBytes,
  );

  double get totalCacheSizeInBytes =>
      dockerSystemDf.totalSizeInBytes +
      mavenLocal.totalSizeInBytes +
      gradleCache.totalSizeInBytes +
      pubCache.totalSizeInBytes;

  String shortenPath(String path) {
    return path.replaceFirst(projectsPath, '');
  }
}

@riverpod
class HomePageViewModel extends _$HomePageViewModel {
  @override
  HomePageState build() {
    return HomePageState.empty();
  }

  Future<void> fetchData() async {
    state = state.copyWith(
      dockerSystemDf: DockerSystemDfWrapper(dockerSystemDf: []),
      mavenLocal: MavenLocal(path: '', totalSizeInBytes: 0),
      gradleCache: GradleCache(path: '', totalSizeInBytes: 0),
      pubCache: PubCache(path: '', totalSizeInBytes: 0),
    );
    final repository = ref.read(devCacheRepositoryProvider);
    repository.fetchDockerSystemDf().then((dockerDfList) {
      state = state.copyWith(
        dockerSystemDf: DockerSystemDfWrapper(dockerSystemDf: dockerDfList),
      );
    });

    repository.fetchMavenLocal().then((mavenLocal) {
      state = state.copyWith(mavenLocal: mavenLocal);
    });

    repository.fetchGradleCache().then((gradleCache) {
      state = state.copyWith(gradleCache: gradleCache);
    });

    repository.fetchPubCache().then((pubCache) {
      state = state.copyWith(pubCache: pubCache);
    });
  }

  void fetchProjects(String path) {
    state = state.copyWith(projectsPath: path);
    final repository = ref.read(devCacheRepositoryProvider);
    repository.fetchProjects(path).then((projects) {
      state = state.copyWith(projectCollection: projects);
    });
  }

  Future<void> deleteBuildArtifacts(String projectPath) async {
    final repository = ref.read(devCacheRepositoryProvider);
    final success = await repository.deleteBuildArtifacts(projectPath);
    if (success) {
      // Refresh projects after deletion
      fetchProjects(state.projectsPath);
    }
  }

  Future<void> deleteMavenLocal() async {
    final repository = ref.read(devCacheRepositoryProvider);
    final success = await repository.deleteMavenLocal();
    if (success) {
      // Refresh maven local after deletion
      repository.fetchMavenLocal().then((mavenLocal) {
        state = state.copyWith(mavenLocal: mavenLocal);
      });
    }
  }

  Future<void> deleteGradleCache() async {
    final repository = ref.read(devCacheRepositoryProvider);
    final success = await repository.deleteGradleCache();
    if (success) {
      // Refresh gradle cache after deletion
      repository.fetchGradleCache().then((gradleCache) {
        state = state.copyWith(gradleCache: gradleCache);
      });
    }
  }

  Future<void> deletePubCache() async {
    final repository = ref.read(devCacheRepositoryProvider);
    final success = await repository.deletePubCache();
    if (success) {
      // Refresh pub cache after deletion
      repository.fetchPubCache().then((pubCache) {
        state = state.copyWith(pubCache: pubCache);
      });
    }
  }

  Future<void> deleteDockerCache() async {
    final repository = ref.read(devCacheRepositoryProvider);
    final success = await repository.deleteDockerCache();
    if (success) {
      // Refresh docker cache after deletion
      repository.fetchDockerSystemDf().then((dockerDfList) {
        state = state.copyWith(
          dockerSystemDf: DockerSystemDfWrapper(dockerSystemDf: dockerDfList),
        );
      });
    }
  }
}
