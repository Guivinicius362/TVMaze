import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tvmaze_core/data/remote_data_sourcers/remote_episode_data_source.dart';
import 'package:tvmaze_core/domain/repositories/episode_repository.dart';

final _getIt = GetIt.instance;

void initCoreDependencies() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.tvmaze.com',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );
  _getIt.registerFactory<Dio>(() => dio);

  _initDataSources();
  _initRepositories();
}

void _initDataSources() {
  _getIt.registerFactory<RemoteEpisodeDataSource>(
    () => RemoteEpisodeDataSourceImpl(),
  );
}

void _initRepositories() {
  _getIt.registerFactory<EpisodeRepository>(() => EpisodeRepositoryImpl());
}
