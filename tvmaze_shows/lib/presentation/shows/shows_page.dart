import 'package:flutter/material.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_design_system/tvmaze_design_system.dart';
import 'package:tvmaze_shows/presentation/favorite_shows_list/favorite_shows_list_widget.dart';
import 'package:tvmaze_shows/presentation/shows_list/shows_list.dart';

class ShowsPage extends StatefulWidget {
  const ShowsPage({super.key});

  @override
  State<ShowsPage> createState() => _ShowsPageState();
}

class _ShowsPageState extends State<ShowsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          AppLocalizations.of(context)!.appTitle,
          style: TVMazeTextStyles.heading6.copyWith(
            color: TVMazeColors.phthaloGreen,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size(0, TVMazeSizes.size8),
          child: Container(
            alignment: Alignment.center,
            child: TabBar(
              tabAlignment: TabAlignment.center,
              isScrollable: false,
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              labelStyle: TVMazeTextStyles.subtitle1.copyWith(
                color: TVMazeColors.phthaloGreen,
              ),
              tabs: [
                Tab(
                  child: SizedBox(
                    width: 150, // Adjust this value as needed
                    child: Center(
                      child: Text(AppLocalizations.of(context)?.shows ?? ''),
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: 150, // Adjust this value as needed
                    child: Center(
                      child:
                          Text(AppLocalizations.of(context)?.favorites ?? ''),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ShowsList(),
          FavoriteShowsList(),
        ],
      ),
    );
  }
}
