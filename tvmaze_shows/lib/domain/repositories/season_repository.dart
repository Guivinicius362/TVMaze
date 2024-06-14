import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/data/remote_data_sources/remote_season_data_source.dart';
import 'package:tvmaze_shows/domain/models/season/season_model.dart';

abstract class SeasonRepository {
  Future<List<SeasonModel>> getSeasons(int showId);
}

class SeasonRepositoryImpl implements SeasonRepository {
  SeasonRepositoryImpl();

  final remoteSeasonDataSource = GetIt.instance<RemoteSeasonDataSource>();

  @override
  Future<List<SeasonModel>> getSeasons(int showId) async {
    final response = await remoteSeasonDataSource.getSeasons(showId);
    final List<SeasonModel> seasons = [];
    for (final season in response.data!) {
      seasons.add(SeasonModel.fromJson(season as Map<String, dynamic>));
    }
    return seasons;
  }
}
