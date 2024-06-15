import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/domain/repositories/show_repository.dart';

class GetFavoritesShowsUseCase {
  final _showRepository = GetIt.instance<ShowRepository>();

  GetFavoritesShowsUseCase();

  Future<List<ShowModel>> call() async {
    final shows = await _showRepository.getFavoritesShows();
    shows.sort((a, b) => a.name!.compareTo(b.name!));
    return shows;
  }

  Future<bool> isFavorite(ShowModel show) async {
    final favorites = await call();
    return favorites.any((favorite) => favorite.id == show.id);
  }
}
