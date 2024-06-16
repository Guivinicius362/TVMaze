import 'package:flutter/material.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_design_system/tvmaze_design_system.dart';

class PeopleItemWidget extends StatelessWidget {
  const PeopleItemWidget({
    super.key,
    required this.title,
    required this.heroTag,
    this.imageURL,
  });

  final String title;
  final String heroTag;
  final String? imageURL;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TVMazeTextStyles.subtitle1,
        ),
      ),
      child: imageURL != null
          ? Hero(
              tag: imageURL!,
              child: FittedBox(
                fit: BoxFit.contain,
                child: CachedNetworkImage(
                  imageUrl: imageURL!,
                ),
              ),
            )
          : const Placeholder(),
    );
  }
}
