import 'package:flutter/material.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_episodes/tvmaze_episodes.dart';
import 'package:tvmaze_shows/presentation/show_details/show_details_page.dart';
import 'package:tvmaze_shows/presentation/shows/shows_page.dart';

class TVMazeRoutes {
  Map<String, WidgetBuilder> get routes => {
        TVMazeNamedRoutes.shows: (context) => const ShowsPage(),
        TVMazeNamedRoutes.showDetails: (context) => const ShowDetailsPage(),
        TVMazeNamedRoutes.episodeDetails: (context) =>
            const EpisodeDetailsPage(),
      };
}
