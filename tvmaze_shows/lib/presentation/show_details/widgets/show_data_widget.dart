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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Airs on: ${show.schedule?.days} at ${show.schedule?.time}',
                style: TvMazeTextStyles.caption,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Runtime: ${show.runtime} minutes',
                style: TvMazeTextStyles.caption,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status: ${show.status} ',
                style: TvMazeTextStyles.caption,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Language: ${show.language}',
                style: TvMazeTextStyles.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
