part of '../shows_list.dart';

enum ShowsListType {
  all,
  favorites,
}

class ShowItemWidget extends StatelessWidget {
  const ShowItemWidget(
      {super.key, required this.show, this.type = ShowsListType.all});

  final ShowModel show;
  final ShowsListType type;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(
          show.name ?? 'unknown',
          textAlign: TextAlign.center,
          style: TVMazeTextStyles.subtitle1,
        ),
      ),
      child: show.image != null
          ? Hero(
              tag: '${show.image!.original}$type',
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
