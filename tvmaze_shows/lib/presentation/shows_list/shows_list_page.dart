import 'package:flutter/material.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_design_system/tvmaze_design_system.dart';
import 'package:tvmaze_shows/presentation/shows_list/bloc/shows_list_cubit.dart';
import 'package:tvmaze_shows/presentation/shows_list/show_item_widget.dart';

part 'shows_list.dart';
part 'favorite_shows_list.dart';

class ShowsListPage extends StatefulWidget {
  const ShowsListPage({super.key});

  @override
  State<ShowsListPage> createState() => _ShowsListPageState();
}

class _ShowsListPageState extends State<ShowsListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // _tabController.addListener(() {
    //   if (_tabController.indexIsChanging) {
    //     if (_tabController.index == 0) {
    //     } else {
    //     }
    //   }
    // });
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
        title: const Text(
          'TV Maze',
          style: TvMazeTextStyles.heading6,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size(0, TVMazeSizes.size8),
          child: Container(
            alignment: Alignment.center,
            child: TabBar(
              tabAlignment: TabAlignment.center,
              labelColor: Colors.black,
              isScrollable: true,
              controller: _tabController,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.grey,
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: TVMazeSizes.size5,
              ),
              tabs: const [
                Tab(text: 'Shows'),
                Tab(text: 'Favorites Show'),
              ],
            ),
          ),
        ),
      ),
      body: const ShowsList(),
    );
  }
}
