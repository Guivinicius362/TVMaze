import 'package:flutter/material.dart';
import 'package:tvmaze/routes.dart';
import 'package:tvmaze_core/di.dart';
import 'package:tvmaze_shows/tvmaze_shows.dart';

void main() {
  initCoreDependencies();
  initShowsDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ShowsListPage(),
      routes: TVMazeRoutes().routes,
    );
  }
}
