part of '../show_details_page.dart';

class ShowEpisodeListWidget extends StatelessWidget {
  const ShowEpisodeListWidget({super.key, required this.episodes});

  final List<EpisodeModel> episodes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: episodes.length,
      itemBuilder: (context, index) => ShowEpisodeWidget(
        episode: episodes[index],
      ),
    );
  }
}
