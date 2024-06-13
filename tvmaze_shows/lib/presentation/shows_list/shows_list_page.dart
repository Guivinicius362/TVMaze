import 'package:flutter/material.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/presentation/shows_list/bloc/shows_list_cubit.dart';

class ShowsListPage extends StatelessWidget {
  const ShowsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shows'),
      ),
      body: BlocProvider(
        create: (context) => GetIt.instance<ShowsListCubit>()..getShows(),
        child: BlocBuilder<ShowsListCubit, ShowsListState>(
          builder: (context, state) {
            if (state is ShowsListLoaded) {
              return ListView.builder(
                itemCount: state.shows.length,
                itemBuilder: (context, index) {
                  final show = state.shows[index];
                  return ListTile(
                    title: Text(show.name!),
                    subtitle: Text(show.summary!),
                  );
                },
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
      ),
    );
  }
}
