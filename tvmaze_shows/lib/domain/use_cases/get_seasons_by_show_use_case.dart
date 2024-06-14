import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/episode/episode_model.dart';
import 'package:tvmaze_shows/domain/models/season/season_model.dart';
import 'package:tvmaze_shows/domain/repositories/episode_repository.dart';
import 'package:tvmaze_shows/domain/repositories/season_repository.dart';

class GetSeasonsByShowUseCase {
  GetSeasonsByShowUseCase();

  final _seasonRepository = GetIt.instance<SeasonRepository>();
  final _episodeRepository = GetIt.instance<EpisodeRepository>();

  Future<List<SeasonModel>> call(int page) async {
    final results = await Future.wait([
      _seasonRepository.getSeasons(page),
      _episodeRepository.getEpisodes(page),
    ]);
    final seasons = results[0] as List<SeasonModel>;
    final episodes = results[1] as List<EpisodeModel>;

    final seasonMap = {for (var season in seasons) season.number: season};

    for (final ep in episodes) {
      final season = seasonMap[ep.season];
      if (season != null) {
        final newEpisodes = List<EpisodeModel>.from(season.episodes)..add(ep);
        seasonMap[ep.season] = season.copyWith(episodes: newEpisodes);
      }
    }

    return seasonMap.values.toList();
  }
}
