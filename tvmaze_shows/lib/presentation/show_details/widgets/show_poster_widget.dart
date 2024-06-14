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
            shape: const CircleBorder(),
            onPressed: () {
              // Handle favorite button press
            },
            child: const Icon(Icons.favorite),
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

class PosterClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
