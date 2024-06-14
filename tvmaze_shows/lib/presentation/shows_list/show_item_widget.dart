import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';

class ShowItemWidget extends StatelessWidget {
  const ShowItemWidget({super.key, required this.show});

  final ShowModel show;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(
          show.name ?? 'unknown',
          textAlign: TextAlign.center,
        ),
      ),
      child: show.image != null
          ? Hero(
              tag: show.id ?? 0,
              child: FittedBox(
                fit: BoxFit.contain,
                child: CachedNetworkImage(
                  imageUrl: show.image!.original,
                ),
              ),
            )
          : const Placeholder(),
    );
  }
}
