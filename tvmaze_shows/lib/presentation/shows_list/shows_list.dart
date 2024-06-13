part of 'shows_list_page.dart';

class ShowsList extends StatefulWidget {
  const ShowsList({
    super.key,
  });

  @override
  State<ShowsList> createState() => _ShowsListState();
}

class _ShowsListState extends State<ShowsList> {
  final _scrollController = ScrollController();
  late ShowsListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = GetIt.instance<ShowsListCubit>()..init();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _cubit.getShows();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<ShowsListCubit, ShowsListState>(
        builder: (context, state) {
          if (state is ShowsListLoaded) {
            return Padding(
              padding: const EdgeInsets.only(top: TVMazeSizes.size5),
              child: GridView.count(
                controller: _scrollController,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(state.shows.length, (index) {
                  final show = state.shows[index];
                  return ShowItemWidget(
                    show: show,
                  );
                }),
              ),
            );
          } else if (state is ShowsListError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
