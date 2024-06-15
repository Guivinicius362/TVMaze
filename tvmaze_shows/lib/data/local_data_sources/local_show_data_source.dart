import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';

abstract class LocalShowDataSource {
  Future<List<ShowModel>> getFavoritesShows();
  Future<void> addFavoriteShow(ShowModel show);
  Future<void> removeFavoriteShow(ShowModel show);
}

class LocalShowDataSourceImpl implements LocalShowDataSource {
  @override
  Future<void> addFavoriteShow(ShowModel show) async =>
      await GetIt.instance<Box<ShowModel>>().add(show);

  @override
  Future<List<ShowModel>> getFavoritesShows() async {
    return GetIt.instance<Box<ShowModel>>().values.toList();
  }

  @override
  Future<void> removeFavoriteShow(ShowModel show) async {
    final box = GetIt.instance<Box<ShowModel>>();
    final index =
        box.values.toList().indexWhere((favorite) => favorite.id == show.id);
    box.deleteAt(index);
  }
}
