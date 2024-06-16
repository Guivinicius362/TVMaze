import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/data/local_data_sources/local_show_data_source.dart';
import 'package:tvmaze_shows/data/remote_data_sources/remote_season_data_source.dart';
import 'package:tvmaze_shows/data/remote_data_sources/remote_show_data_source.dart';
import 'package:tvmaze_core/domain/models/country/country_model.dart';
import 'package:tvmaze_shows/domain/models/network/network_model.dart';
import 'package:tvmaze_shows/domain/models/season/season_model.dart';
import 'package:tvmaze_shows/domain/models/show/external/external_model.dart';
import 'package:tvmaze_shows/domain/models/show/schedule/schedule_model.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/domain/repositories/season_repository.dart';
import 'package:tvmaze_shows/domain/repositories/show_repository.dart';
import 'package:tvmaze_shows/domain/use_cases/add_favorite_show_use_case.dart';
import 'package:tvmaze_shows/domain/use_cases/get_favorites_shows_use_case.dart';
import 'package:tvmaze_shows/domain/use_cases/get_seasons_by_show_use_case.dart';
import 'package:tvmaze_shows/domain/use_cases/get_shows_by_page_use_case.dart';
import 'package:tvmaze_shows/domain/use_cases/remove_favorite_show_use_case.dart';
import 'package:tvmaze_shows/domain/use_cases/search_show_by_query_use_case.dart';
import 'package:tvmaze_shows/presentation/favorite_shows_list/bloc/favorite_shows_list_cubit.dart';
import 'package:tvmaze_shows/presentation/show_details/bloc/show_details_cubit.dart';
import 'package:tvmaze_shows/presentation/shows_list/bloc/shows_list_cubit.dart';

export 'package:tvmaze_shows/presentation/shows/shows_page.dart';
export 'package:tvmaze_shows/presentation/show_details/show_details_page.dart';

final _getIt = GetIt.instance;

Future<void> initShowsDependencies() async {
  await _initHive();
  _initDataSources();
  _initRepositories();
  _initUseCases();
  _initBlocs();
}

Future<void> _initHive() async {
  Hive
    ..registerAdapter(ShowModelAdapter())
    ..registerAdapter(NetworkAdapter())
    ..registerAdapter(ScheduleAdapter())
    ..registerAdapter(SeasonModelAdapter())
    ..registerAdapter(CountryAdapter())
    ..registerAdapter(ExternalsAdapter());

  final box =
      await Hive.openBox<ShowModel>(TVMazeHiveKeys.favoriteShowsBoxName);
  _getIt.registerSingleton<Box<ShowModel>>(box);
}

void _initDataSources() {
  _getIt
      .registerFactory<RemoteShowDataSource>(() => RemoteShowDataSourceImpl());
  _getIt.registerFactory<LocalShowDataSource>(() => LocalShowDataSourceImpl());
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
  _getIt.registerFactory<GetFavoritesShowsUseCase>(
    () => GetFavoritesShowsUseCase(),
  );
  _getIt.registerFactory<AddFavoriteShowUseCase>(
    () => AddFavoriteShowUseCase(),
  );
  _getIt.registerFactory<RemoveFavoriteShowUseCase>(
    () => RemoveFavoriteShowUseCase(),
  );
}

void _initBlocs() {
  _getIt.registerFactory<ShowDetailsCubit>(() => ShowDetailsCubit());
  _getIt.registerFactory<ShowsListCubit>(() => ShowsListCubit());
  _getIt
      .registerFactory<FavoriteShowsListCubit>(() => FavoriteShowsListCubit());
}
