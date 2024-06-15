part of '../show_details_page.dart';

class ShowEpisodeWidget extends StatelessWidget {
  const ShowEpisodeWidget({
    super.key,
    required this.episode,
  });

  final EpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          TVMazeNamedRoutes.episodeDetails,
          arguments: episode,
        );
      },
      child: Card(
        color: Colors.black,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              key: ValueKey(episode.image?.original),
              child: Hero(
                tag: episode.image?.original ?? '',
                child: CachedNetworkImage(
                  imageUrl: episode.image?.original ?? '',
                  progressIndicatorBuilder: (context, url, progress) {
                    return Shimmer.fromColors(
                      baseColor: TVMazeColors.baseShimmerColor,
                      highlightColor: TVMazeColors.highlightShimmerColor,
                      child: Container(
                        width: double.infinity,
                        height: 220,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: TVMazeSizes.size6,
              left: TVMazeSizes.size5,
              child: Padding(
                padding: const EdgeInsets.all(TVMazeSizes.size3),
                child: Text(
                  episode.number.toString(),
                  style: TVMazeTextStyles.subtitle1,
                ),
              ),
            ),
            Positioned(
              top: TVMazeSizes.size6,
              right: TVMazeSizes.size5,
              child: Padding(
                padding: const EdgeInsets.all(TVMazeSizes.size3),
                child: Text(
                  episode.name!,
                  style: TVMazeTextStyles.subtitle1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
