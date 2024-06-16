import 'package:flutter/material.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_design_system/tvmaze_design_system.dart';
import 'package:tvmaze_design_system/widgets/network_error_widget.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/presentation/shows_list/bloc/shows_list_cubit.dart';

part './widgets/shimmer_show_list.dart';
part './widgets/show_item_widget.dart';

class ShowsList extends StatefulWidget {
  const ShowsList({
    super.key,
  });

  @override
  State<ShowsList> createState() => _ShowsListState();
}

class _ShowsListState extends State<ShowsList> {
  final _scrollController = ScrollController();
  late ShowsListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = GetIt.instance<ShowsListCubit>()..init();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _cubit.close();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _cubit.getShows();
    }
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
            child: BlocBuilder<ShowsListCubit, ShowsListState>(
              builder: (context, state) {
                if (state is ShowsListLoading) {
                  return const ShimmerShowList();
                }

                if (state is ShowsListLoaded) {
                  return Padding(
                    padding: const EdgeInsets.only(top: TVMazeSizes.size5),
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.count(
                            controller: _scrollController,
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
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is ShowsListError) {
                  return GenericErrorWidget(
                    message: state.error.message,
                    icon: Icons.error,
                    description: state.error.stackTrace ?? '',
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
