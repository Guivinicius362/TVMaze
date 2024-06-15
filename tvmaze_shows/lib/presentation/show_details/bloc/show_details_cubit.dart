import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/season/season_model.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/domain/use_cases/add_favorite_show_use_case.dart';
import 'package:tvmaze_shows/domain/use_cases/get_favorites_shows_use_case.dart';
import 'package:tvmaze_shows/domain/use_cases/get_seasons_by_show_use_case.dart';
import 'package:tvmaze_shows/domain/use_cases/remove_favorite_show_use_case.dart';

part 'show_details_state.dart';

class ShowDetailsCubit extends Cubit<ShowDetailsState> {
  ShowDetailsCubit() : super(ShowDetailsInitial());

  final _getSeasonsByShow = GetIt.instance<GetSeasonsByShowUseCase>();
  final _addFavoriteShow = GetIt.instance<AddFavoriteShowUseCase>();
  final _removeFavoriteShow = GetIt.instance<RemoveFavoriteShowUseCase>();
  final _getFavoritesShows = GetIt.instance<GetFavoritesShowsUseCase>();

  Future<void> init(ShowModel currentShow) async {
    emit(ShowDetailsLoading(show: currentShow));
    if (currentShow.id == null) {
      emit(const ShowDetailsError(error: 'Show id is null'));
      return;
    }
    try {
      final seasons = await _getSeasonsByShow(currentShow.id!);
      final isFavorite = await _getFavoritesShows.isFavorite(currentShow);
      emit(ShowDetailsLoaded(
          show: currentShow, seasons: seasons, isFavorite: isFavorite));
    } on Exception catch (e) {
      emit(ShowDetailsError(error: e.toString()));
    }
  }

  void selectSeason(int index) {
    final currentState = state;
    if (currentState is ShowDetailsLoaded) {
      emit(currentState.copyWith(selectedSeasonIndex: index));
    }
  }

  void toggleFavorite(ShowModel show) async {
    final currentState = state;
    if (currentState is ShowDetailsLoaded) {
      if (currentState.isFavorite) {
        await _removeFavoriteShow(show);
      } else {
        await _addFavoriteShow(show);
      }
      emit(
        currentState.copyWith(
          isFavorite: !currentState.isFavorite,
        ),
      );
    }
  }
}
