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
                'Airs on: ${show.schedule?.days} at ${show.schedule?.time}',
                style: TVMazeTextStyles.caption,
              ),
              const SizedBox(
                height: TVMazeSizes.size3,
              ),
              Text(
                'Runtime: ${show.runtime} minutes',
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
                'Status: ${show.status} ',
                style: TVMazeTextStyles.caption,
              ),
              const SizedBox(
                height: TVMazeSizes.size3,
              ),
              Text(
                'Language: ${show.language}',
                style: TVMazeTextStyles.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
