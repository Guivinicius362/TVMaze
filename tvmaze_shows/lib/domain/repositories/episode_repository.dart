import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/data/remote_data_sources/remote_episode_data_source.dart';
import 'package:tvmaze_shows/domain/models/episode/episode_model.dart';

abstract class EpisodeRepository {
  Future<List<EpisodeModel>> getEpisodes(int showId);
}

class EpisodeRepositoryImpl implements EpisodeRepository {
  EpisodeRepositoryImpl();

  final remoteEpisodeDataSource = GetIt.instance<RemoteEpisodeDataSource>();

  @override
  Future<List<EpisodeModel>> getEpisodes(int showId) async {
    final response = await remoteEpisodeDataSource.getEpisodes(showId);
    final List<EpisodeModel> episodes = [];
    for (final episode in response.data!) {
      episodes.add(EpisodeModel.fromJson(episode as Map<String, dynamic>));
    }
    return episodes;
  }
}
