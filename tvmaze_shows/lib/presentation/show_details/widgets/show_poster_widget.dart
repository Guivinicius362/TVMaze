part of '../show_details_page.dart';

class ShowPoster extends StatelessWidget {
  const ShowPoster({
    super.key,
    required this.show,
  });

  final ShowModel show;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: PosterClipper(),
          child: Hero(
            tag: show.id ?? 0,
            child: FittedBox(
              fit: BoxFit.contain,
              child: CachedNetworkImage(
                imageUrl: show.image!.original,
              ),
            ),
          ),
        ),
        Positioned(
          top: 24,
          left: 0,
          right: 0,
          child: Text(
            show.name ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          right: 24,
          child: FloatingActionButton(
            backgroundColor: TvmazeColors.phthaloGreen,
            shape: const CircleBorder(),
            onPressed: () {
              // Handle favorite button press
            },
            child: const Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 24,
          left: 24,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
