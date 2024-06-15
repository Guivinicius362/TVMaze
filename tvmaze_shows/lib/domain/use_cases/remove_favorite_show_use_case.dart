import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/domain/repositories/show_repository.dart';

class RemoveFavoriteShowUseCase {
  final _showRepository = GetIt.instance<ShowRepository>();

  RemoveFavoriteShowUseCase();

  Future<void> call(ShowModel show) async =>
      await _showRepository.removeFavoriteShow(show);
}
