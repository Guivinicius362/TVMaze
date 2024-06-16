import 'package:flutter/material.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_design_system/tvmaze_design_system.dart';
import 'package:tvmaze_people/presentation/people_list/bloc/people_list_cubit.dart';
import 'package:tvmaze_people/presentation/people_list/widgets/people_item_widget.dart';

class PeopleListPage extends StatefulWidget {
  const PeopleListPage({super.key});

  @override
  State<PeopleListPage> createState() => _PeopleListPageState();
}

class _PeopleListPageState extends State<PeopleListPage> {
  late PeopleListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = GetIt.instance<PeopleListCubit>()..getAllPeople();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
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
        ),
        body: Column(
          children: [
            const SizedBox(height: TVMazeSizes.size3),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TVMazeSizes.size5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)?.search,
                  hintStyle:
                      TVMazeTextStyles.subtitle1.copyWith(color: Colors.white),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(bottom: TVMazeSizes.size3),
                    child: Icon(Icons.search),
                  ),
                ),
                style: TVMazeTextStyles.subtitle1.copyWith(color: Colors.white),
                onChanged: _cubit.onSearchChanged,
              ),
            ),
            Expanded(
              child: BlocBuilder<PeopleListCubit, PeopleListState>(
                builder: (context, state) {
                  if (state is PeopleListLoaded) {
                    return Padding(
                      padding: const EdgeInsets.only(top: TVMazeSizes.size5),
                      child: Column(
                        children: [
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                              mainAxisSpacing: TVMazeSizes.size3,
                              crossAxisSpacing: TVMazeSizes.size3,
                              children:
                                  List.generate(state.people.length, (index) {
                                final people = state.people[index];
                                return GestureDetector(
                                  onTap: () => Navigator.of(context).pushNamed(
                                    TVMazeNamedRoutes.showDetails,
                                    arguments: people,
                                  ),
                                  child: PeopleItemWidget(
                                    title: people.name ?? '',
                                    heroTag: people.name ?? '',
                                    imageURL: people.image?.original ?? '',
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        TVMazeColors.phthaloGreen,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
