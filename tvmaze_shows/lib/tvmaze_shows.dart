import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/data/remote_data_sources/remote_season_data_source.dart';
import 'package:tvmaze_shows/data/remote_data_sources/remote_show_data_source.dart';
import 'package:tvmaze_shows/domain/repositories/season_repository.dart';
import 'package:tvmaze_shows/domain/repositories/show_repository.dart';
import 'package:tvmaze_shows/domain/use_cases/get_seasons_by_show_use_case.dart';
import 'package:tvmaze_shows/domain/use_cases/get_shows_by_page_use_case.dart';
import 'package:tvmaze_shows/domain/use_cases/search_show_by_query_use_case.dart';
import 'package:tvmaze_shows/presentation/show_details/bloc/show_details_cubit.dart';
import 'package:tvmaze_shows/presentation/shows_list/bloc/shows_list_cubit.dart';

export 'package:tvmaze_shows/presentation/shows_list/shows_list_page.dart';
export 'package:tvmaze_shows/presentation/show_details/show_details_page.dart';

final _getIt = GetIt.instance;

void initShowsDependencies() {
  _initDataSources();
  _initRepositories();
  _initUseCases();
  _initBlocs();
}

void _initDataSources() {
  _getIt
      .registerFactory<RemoteShowDataSource>(() => RemoteShowDataSourceImpl());

  _getIt.registerFactory<RemoteSeasonDataSource>(
    () => RemoteSeasonDataSourceImpl(),
  );
}

void _initRepositories() {
  _getIt.registerFactory<ShowRepository>(() => ShowRepositoryImpl());
  _getIt.registerFactory<SeasonRepository>(() => SeasonRepositoryImpl());
}

void _initUseCases() {
  _getIt.registerFactory<GetShowsByPageUseCase>(() => GetShowsByPageUseCase());
  _getIt.registerFactory<SearchShowByQueryUseCase>(
      () => SearchShowByQueryUseCase());
  _getIt.registerFactory<GetSeasonsByShowUseCase>(
    () => GetSeasonsByShowUseCase(),
  );
}

void _initBlocs() {
  _getIt.registerFactory<ShowDetailsCubit>(() => ShowDetailsCubit());
  _getIt.registerFactory<ShowsListCubit>(() => ShowsListCubit());
}
