import 'package:flutter/material.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/presentation/show_details/show_details_page.dart';
import 'package:tvmaze_shows/presentation/shows_list/shows_list_page.dart';

class TVMazeRoutes {
  Map<String, WidgetBuilder> get routes => {
        TvmazeNamedRoutes.showsList: (context) => const ShowsListPage(),
        TvmazeNamedRoutes.showDetails: (context) => const ShowDetailsPage()
      };
}
