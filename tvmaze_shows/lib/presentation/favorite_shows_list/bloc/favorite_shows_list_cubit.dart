import 'dart:async';

import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/domain/use_cases/get_favorites_shows_use_case.dart';

part 'favorite_shows_list_state.dart';

class FavoriteShowsListCubit extends Cubit<FavoriteShowsListState> {
  FavoriteShowsListCubit() : super(const FavoriteShowsListLoading());

  final _getFavoritesShowsUseCase = GetIt.instance<GetFavoritesShowsUseCase>();

  Future<void> init() async {
    try {
      final shows = await _getFavoritesShowsUseCase();
      emit(FavoriteShowsListLoaded(shows));
    } catch (e) {
      emit(FavoriteShowsListError(e.toString()));
    }
  }

  Future<void> _searchShow(String query, List<ShowModel> showList) async {
    final filteredShows = showList
        .where((show) => show.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(FavoriteShowsListLoaded(filteredShows));
  }

  void onSearchChanged(String searchText) {
    final showList = (state as FavoriteShowsListLoaded).shows;
    emit(const FavoriteShowsListLoading());
    if (searchText.isEmpty) {
      init();
      return;
    }

    _searchShow(searchText, showList);
  }
}
