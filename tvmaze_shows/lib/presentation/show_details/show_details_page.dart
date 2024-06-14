import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_design_system/text_styles/tvmaze_text_styles.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/presentation/show_details/bloc/show_details_cubit.dart';

part './widgets/show_data_widget.dart';
part './widgets/show_poster_widget.dart';

class ShowDetailsPage extends StatelessWidget {
  const ShowDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final show = ModalRoute.of(context)!.settings.arguments as ShowModel;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ShowPoster(show: show),
            if (show.genres != null)
              Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: show.genres!.map((String genre) {
                  return Chip(
                    label: Text(
                      genre,
                    ),
                  );
                }).toList(),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Html(
                data: show.summary ?? '',
                style: {
                  "body": Style(
                    color: Colors.white,
                  ),
                },
              ),
            ),
            ShowData(show: show),
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
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.seasons.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<ShowDetailsCubit>()
                                      .selectSeason(index);
                                },
                                child: Container(
                                  width: 100,
                                  color: state.selectedSeasonIndex == index
                                      ? Colors.blue
                                      : Colors.red,
                                  child: Center(
                                    child: Text(
                                      state.seasons[index].number.toString(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.seasons[state.selectedSeasonIndex]
                              .episodes.length,
                          itemBuilder: (context, index) {
                            final episode = state
                                .seasons[state.selectedSeasonIndex]
                                .episodes[index];
                            return Card(
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    key: ValueKey(episode.image?.original),
                                    child: Image.network(
                                        episode.image?.original ?? ''),
                                  ),
                                  Positioned(
                                    top: 24,
                                    left: 16,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        episode.number.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 24,
                                    right: 16,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        episode.name!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
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
