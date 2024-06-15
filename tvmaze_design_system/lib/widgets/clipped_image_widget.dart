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
        Positioned(
          top: 24,
          left: 0,
          right: 0,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          right: 24,
          child: FloatingActionButton(
            backgroundColor: TvmazeColors.phthaloGreen,
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
          top: 24,
          left: 24,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
