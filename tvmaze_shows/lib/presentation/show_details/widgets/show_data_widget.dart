part of '../show_details_page.dart';

class ShowData extends StatelessWidget {
  const ShowData({
    super.key,
    required this.show,
  });

  final ShowModel show;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: TVMazeSizes.size5, vertical: TVMazeSizes.size3),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${AppLocalizations.of(context)?.airsOn}: ${show.schedule?.days} at ${show.schedule?.time}',
                style: TVMazeTextStyles.caption,
              ),
              const SizedBox(
                height: TVMazeSizes.size3,
              ),
              Text(
                '${AppLocalizations.of(context)?.runtime}: ${show.runtime} minutes',
                style: TVMazeTextStyles.caption,
              ),
            ],
          ),
          const SizedBox(
            height: TVMazeSizes.size3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${AppLocalizations.of(context)?.status} ${show.status} ',
                style: TVMazeTextStyles.caption,
              ),
              const SizedBox(
                height: TVMazeSizes.size3,
              ),
              Text(
                '${AppLocalizations.of(context)?.language}: ${show.language}',
                style: TVMazeTextStyles.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
