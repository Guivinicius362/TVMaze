import 'package:flutter/material.dart';
import 'package:tvmaze/routes.dart';
import 'package:tvmaze_core/di.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_design_system/tvmaze_design_system.dart';
import 'package:tvmaze_home/tvmaze_home.dart';
import 'package:tvmaze_people/tvmaze_people.dart';
import 'package:tvmaze_shows/tvmaze_shows.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initCoreDependencies();
  await initShowsDependencies();
  await initPeopleDepedencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TVMazeColors.phthaloGreen),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
      routes: TVMazeRoutes().routes,
    );
  }
}
