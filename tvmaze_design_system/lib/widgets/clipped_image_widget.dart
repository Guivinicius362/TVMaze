import 'package:flutter/material.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_design_system/tvmaze_design_system.dart';
import 'package:tvmaze_design_system/widgets/poster_clipper.dart';

class ClippedImage extends StatelessWidget {
  const ClippedImage({
    super.key,
    required this.imageURL,
    required this.title,
  });

  final String imageURL;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: PosterClipper(),
          child: Hero(
            tag: imageURL,
            child: FittedBox(
              fit: BoxFit.contain,
              child: CachedNetworkImage(
                imageUrl: imageURL,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(19),
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 92,
              child: Text(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TVMazeTextStyles.heading6,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: TVMazeSizes.size6,
          right: TVMazeSizes.size6,
          child: FloatingActionButton(
            backgroundColor: TVMazeColors.phthaloGreen,
            shape: const CircleBorder(),
            onPressed: () {
              // Handle favorite button press
            },
            child: const Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: TVMazeSizes.size6,
          left: TVMazeSizes.size6,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: TVMazeSizes.size6,
            ),
          ),
        ),
      ],
    );
  }
}
