import 'package:flutter/material.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_design_system/tvmaze_design_system.dart';
import 'package:tvmaze_shows/presentation/favorite_shows_list/bloc/favorite_shows_list_cubit.dart';
import 'package:tvmaze_shows/presentation/shows_list/shows_list.dart';

class FavoriteShowsList extends StatefulWidget {
  const FavoriteShowsList({
    super.key,
  });

  @override
  State<FavoriteShowsList> createState() => _FavoriteShowsListState();
}

class _FavoriteShowsListState extends State<FavoriteShowsList> {
  late FavoriteShowsListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = GetIt.instance<FavoriteShowsListCubit>()..init();
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
      child: Column(
        children: [
          const SizedBox(height: TVMazeSizes.size3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TVMazeSizes.size5),
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
            child: BlocBuilder<FavoriteShowsListCubit, FavoriteShowsListState>(
              builder: (context, state) {
                if (state is FavoriteShowsListLoading) {
                  return const ShimmerShowList();
                }

                if (state is FavoriteShowsListLoaded) {
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
                                List.generate(state.shows.length, (index) {
                              final show = state.shows[index];
                              return GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                  TVMazeNamedRoutes.showDetails,
                                  arguments: show,
                                ),
                                child: ShowItemWidget(
                                  show: show,
                                  type: ShowsListType.favorites,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is FavoriteShowsListError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
