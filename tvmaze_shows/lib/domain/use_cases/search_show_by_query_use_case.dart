import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/domain/repositories/show_repository.dart';

class SearchShowByQueryUseCase {
  SearchShowByQueryUseCase();

  final _showsRepository = GetIt.instance<ShowRepository>();

  Future<List<ShowModel>> call(String query) async {
    return _showsRepository.searchShow(query);
  }
}
