import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/presentation/show_details/bloc/show_details_cubit.dart';

class ShowDetailsPage extends StatelessWidget {
  const ShowDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final show = ModalRoute.of(context)!.settings.arguments as ShowModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(show.name ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: show.id ?? 0,
              child: FittedBox(
                fit: BoxFit.contain,
                child: CachedNetworkImage(
                  imageUrl: show.image!.original,
                ),
              ),
            ),
            Text(show.summary ?? ''),
            BlocProvider(
              create: (context) =>
                  GetIt.instance<ShowDetailsCubit>()..init(show),
              child: BlocBuilder<ShowDetailsCubit, ShowDetailsState>(
                builder: (context, state) {
                  if (state is ShowDetailsLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is ShowDetailsLoaded) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.seasons.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<ShowDetailsCubit>()
                                      .selectSeason(index);
                                },
                                child: Container(
                                  width: 100,
                                  color: state.selectedSeasonIndex == index
                                      ? Colors.blue
                                      : Colors.red,
                                  child: Center(
                                    child: Text(
                                      state.seasons[index].number.toString(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.seasons[state.selectedSeasonIndex]
                              .episodes.length,
                          itemBuilder: (context, index) {
                            return Text(state.seasons[state.selectedSeasonIndex]
                                    .episodes[index].name ??
                                '');
                          },
                        ),
                      ],
                    );
                  } else if (state is ShowDetailsError) {
                    return Text(state.error);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
