import 'package:flutter/material.dart';
import 'package:tvmaze_core/domain/models/episode/episode_model.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_design_system/tvmaze_design_system.dart';
import 'package:tvmaze_design_system/widgets/clipped_image_widget.dart';
import 'package:tvmaze_shows/domain/models/season/season_model.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/presentation/show_details/bloc/show_details_cubit.dart';

part './widgets/show_data_widget.dart';
part './widgets/show_season_list_widget.dart';
part './widgets/show_episode_list_widget.dart';
part './widgets/show_episode_widget.dart';
part './widgets/show_expandable_data_widget.dart';

class ShowDetailsPage extends StatelessWidget {
  const ShowDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final show = ModalRoute.of(context)!.settings.arguments as ShowModel;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClippedImage(
              imageURL: show.image!.original,
              title: show.name ?? '',
            ),
            ShowExpandableDataWidget(show: show),
            BlocProvider(
              create: (context) =>
                  GetIt.instance<ShowDetailsCubit>()..init(show),
              child: BlocBuilder<ShowDetailsCubit, ShowDetailsState>(
                builder: (context, state) {
                  if (state is ShowDetailsLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is ShowDetailsLoaded) {
                    return Column(
                      children: [
                        const Text(
                          'Seasons',
                          style: TvMazeTextStyles.heading6,
                        ),
                        ShowSeasonListWidget(
                          seasons: state.seasons,
                          selectedSeasonIndex: state.selectedSeasonIndex,
                        ),
                        ShowEpisodeListWidget(
                          episodes:
                              state.seasons[state.selectedSeasonIndex].episodes,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    );
                  } else if (state is ShowDetailsError) {
                    return Text(state.error);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
