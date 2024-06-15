import 'package:flutter/material.dart';
import 'package:tvmaze_core/domain/models/episode/episode_model.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_design_system/tvmaze_design_system.dart';
import 'package:tvmaze_design_system/widgets/clipped_image_widget.dart';

class EpisodeDetailsPage extends StatelessWidget {
  const EpisodeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final episode = ModalRoute.of(context)!.settings.arguments as EpisodeModel;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClippedImage(
              imageURL: episode.image?.original ?? '',
              title: episode.name ?? '',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Season ${episode.season.toString()}',
                    style: TVMazeTextStyles.subtitle1,
                  ),
                  const Spacer(),
                  Text(
                    'Episode ${episode.number.toString()}',
                    style: TVMazeTextStyles.subtitle1,
                  ),
                  const Spacer(),
                  Text(
                    'Rating ${episode.rating?.average.toString()}',
                    style: TVMazeTextStyles.subtitle1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Html(
                data: episode.summary ?? '',
                style: {
                  'body': Style(
                    fontSize: FontSize(16),
                    color: const Color(0xFFE0E0E0),
                  ),
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Aired on ${episode.airdate} at ${episode.airtime}',
                    style: TVMazeTextStyles.caption,
                  ),
                  Text(
                    'Runtime ${episode.runtime.toString()} minutes',
                    style: TVMazeTextStyles.caption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
