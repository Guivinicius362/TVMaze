import 'package:tvmaze_shows/domain/models/show/show_model.dart';

abstract class LocalShowDataSource {
  Future<List<ShowModel>> getFavoritesShows();
  Future<void> addFavoriteShow(ShowModel show);
}
