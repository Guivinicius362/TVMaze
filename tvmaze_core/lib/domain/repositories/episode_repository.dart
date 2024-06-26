import 'package:tvmaze_core/domain/models/episode/episode_model.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_core/data/remote_data_sourcers/remote_episode_data_source.dart';

abstract class EpisodeRepository {
  Future<List<EpisodeModel>> getEpisodes(int showId);
}

class EpisodeRepositoryImpl implements EpisodeRepository {
  EpisodeRepositoryImpl();

  final remoteEpisodeDataSource = GetIt.instance<RemoteEpisodeDataSource>();

  @override
  Future<List<EpisodeModel>> getEpisodes(int showId) async {
    try {
      final response = await remoteEpisodeDataSource.getEpisodes(showId);
      final List<EpisodeModel> episodes = [];
      for (final episode in response.data!) {
        episodes.add(EpisodeModel.fromJson(episode as Map<String, dynamic>));
      }
      return episodes;
    } on DioException catch (e) {
      if (e.response != null) {
        throw TVMazeServerError(e.response!.statusMessage!);
      } else {
        throw TVMazeNetworkError(e.message ?? 'Network error');
      }
    } catch (e) {
      throw TVMazeUnknownError(e.toString());
    }
  }
}
