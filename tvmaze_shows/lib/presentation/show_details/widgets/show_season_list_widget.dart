part of '../show_details_page.dart';

class ShowSeasonListWidget extends StatelessWidget {
  const ShowSeasonListWidget({
    super.key,
    required this.seasons,
    required this.selectedSeasonIndex,
  });

  final List<SeasonModel> seasons;
  final int selectedSeasonIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TVMazeSizes.size3),
      child: SizedBox(
        height: TVMazeSizes.size8,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: seasons.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.read<ShowDetailsCubit>().selectSeason(index);
              },
              child: Container(
                width: 100,
                color: selectedSeasonIndex == index
                    ? TVMazeColors.phthaloGreen
                    : TVMazeColors.phthaloGreen.withOpacity(0.5),
                child: Center(
                  child: Text(
                    seasons[index].number.toString(),
                    style: TVMazeTextStyles.button.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
