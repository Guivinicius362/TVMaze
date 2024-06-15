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
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
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
      ),
    );
  }
}
