import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/domain/repositories/show_repository.dart';

class AddFavoriteShowUseCase {
  final _showRepository = GetIt.instance<ShowRepository>();

  AddFavoriteShowUseCase();

  Future<void> call(ShowModel show) async {
    await _showRepository.addFavoriteShow(show);
  }
}
