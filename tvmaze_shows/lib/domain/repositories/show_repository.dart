import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/data/remote_data_sources/remote_show_data_source.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';

abstract class ShowRepository {
  Future<List<ShowModel>> getShows(int page);
}

class ShowRepositoryImpl implements ShowRepository {
  ShowRepositoryImpl();

  final remoteShowDataSource = GetIt.instance<RemoteShowDataSource>();

  @override
  Future<List<ShowModel>> getShows(int page) async {
    final response = await remoteShowDataSource.getShows(page);
    final List<ShowModel> shows = [];
    for (final show in response.data!) {
      shows.add(ShowModel.fromJson(show as Map<String, dynamic>));
    }
    return shows;
  }
}