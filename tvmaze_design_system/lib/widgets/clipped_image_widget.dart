import 'package:flutter/material.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_design_system/tvmaze_design_system.dart';
import 'package:tvmaze_design_system/widgets/poster_clipper.dart';

class ClippedImage extends StatelessWidget {
  const ClippedImage({
    super.key,
    required this.imageURL,
    required this.title,
    this.bottomLeftWidget,
    required this.heroId,
  });

  final String imageURL;
  final String title;
  final Widget? bottomLeftWidget;
  final String heroId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: PosterClipper(),
          child: Hero(
            tag: heroId,
            child: FittedBox(
              fit: BoxFit.contain,
              child: CachedNetworkImage(
                imageUrl: imageURL,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(42),
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
        if (bottomLeftWidget != null) bottomLeftWidget!,
        Positioned(
          top: TVMazeSizes.size7,
          left: TVMazeSizes.size6,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const SizedBox(
              width: TVMazeSizes.size8,
              height: TVMazeSizes.size8,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: TVMazeSizes.size6,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
