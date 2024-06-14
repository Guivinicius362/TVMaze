import 'package:flutter/material.dart';
import 'package:tvmaze_shows/presentation/show_details/show_details_page.dart';
import 'package:tvmaze_shows/presentation/shows_list/shows_list_page.dart';

class TVMazeRoutes {
  static const String showsList = '/showsList';
  static const String showDetails = '/showDetails';

  Map<String, WidgetBuilder> get routes => {
        showsList: (context) => const ShowsListPage(),
        showDetails: (context) => const ShowDetailsPage()
      };
}
