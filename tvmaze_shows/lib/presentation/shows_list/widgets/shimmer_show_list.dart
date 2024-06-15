part of '../shows_list.dart';

class ShimmerShowList extends StatelessWidget {
  const ShimmerShowList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: TVMazeSizes.size5),
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              mainAxisSpacing: TVMazeSizes.size3,
              crossAxisSpacing: TVMazeSizes.size3,
              children: List.generate(10, (index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: TVMazeSizes.size3),
                  child: Shimmer.fromColors(
                    baseColor: TVMazeColors.baseShimmerColor,
                    highlightColor: TVMazeColors.highlightShimmerColor,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
