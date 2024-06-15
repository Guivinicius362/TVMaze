import 'package:flutter/material.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_design_system/tvmaze_design_system.dart';
import 'package:tvmaze_shows/presentation/shows_list/bloc/shows_list_cubit.dart';
import 'package:tvmaze_shows/presentation/shows_list/widgets/show_item_widget.dart';

part 'widgets/shows_list_widget.dart';
part 'widgets/favorite_shows_list_widget.dart';

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
        backgroundColor: Colors.black,
        title: Text(
          AppLocalizations.of(context)?.helloWorld ?? 'failed',
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
              tabs: const [
                Tab(
                  child: SizedBox(
                    width: 150, // Adjust this value as needed
                    child: Center(
                      child: Text('Shows'),
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: 150, // Adjust this value as needed
                    child: Center(
                      child: Text('Favorites Show'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: const ShowsList(),
    );
  }
}
