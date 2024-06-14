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
              child: const Text('See more', style: TvMazeTextStyles.caption),
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
            child: const Text('See less', style: TvMazeTextStyles.caption),
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
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          children: show.genres!.map((String genre) {
            return Chip(
              label: Text(
                genre,
              ),
            );
          }).toList(),
        ),
      Padding(
        padding: const EdgeInsets.all(8.0),
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