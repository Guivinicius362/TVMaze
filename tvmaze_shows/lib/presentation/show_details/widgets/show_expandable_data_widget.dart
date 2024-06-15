part of '../show_details_page.dart';

class ShowExpandableDataWidget extends StatefulWidget {
  const ShowExpandableDataWidget({super.key, required this.show});

  final ShowModel show;

  @override
  State<ShowExpandableDataWidget> createState() =>
      _ShowExpandableDataWidgetState();
}

class _ShowExpandableDataWidgetState extends State<ShowExpandableDataWidget> {
  final ExpandableController _controller = ExpandableController();

  @override
  Widget build(BuildContext context) {
    final show = widget.show;
    return ExpandablePanel(
      controller: _controller,
      collapsed: Stack(
        children: [
          SizedBox(
            height: 150,
            child: SingleChildScrollView(
              child: Column(
                children: _buildContent(show),
              ),
            ),
          ),
          Container(
            height: 150,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
                stops: [0.6, 1.0],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: TextButton(
              child: Text(
                AppLocalizations.of(context)!.seemore,
                style: TVMazeTextStyles.caption,
              ),
              onPressed: () => _controller.toggle(),
            ),
          ),
        ],
      ),
      expanded: Column(
        children: [
          Column(
            children: _buildContent(show),
          ),
          TextButton(
            child: Text(
              AppLocalizations.of(context)!.seeLess,
              style: TVMazeTextStyles.caption,
            ),
            onPressed: () => _controller.toggle(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildContent(ShowModel show) {
    return [
      if (show.genres != null)
        Wrap(
          spacing: TVMazeSizes.size3,
          runSpacing: TVMazeSizes.size2,
          children: show.genres!.map((String genre) {
            return Chip(
              label: Text(
                genre,
                style: TVMazeTextStyles.caption.copyWith(
                  color: Colors.black,
                ),
              ),
            );
          }).toList(),
        ),
      Padding(
        padding: const EdgeInsets.all(TVMazeSizes.size3),
        child: Html(
          data: show.summary ?? '',
          style: {
            "body": Style(
              color: Colors.white,
            ),
          },
        ),
      ),
      ShowData(show: show),
    ];
  }
}
