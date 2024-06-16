part of 'shows_list_cubit.dart';

abstract class ShowsListState extends Equatable {
  const ShowsListState();
}

class ShowsListLoading extends ShowsListState {
  const ShowsListLoading();

  @override
  List<Object> get props => [];
}

class ShowsListLoaded extends ShowsListState {
  final List<ShowModel> shows;
  final int page;
  const ShowsListLoaded(this.shows, this.page);

  @override
  List<Object> get props => [shows, page];

  ShowsListLoaded copyWith({
    List<ShowModel>? shows,
    int? page,
  }) {
    return ShowsListLoaded(
      shows ?? this.shows,
      page ?? this.page,
    );
  }
}

class ShowsListError extends ShowsListState {
  final TVMazeError error;

  const ShowsListError(this.error);

  @override
  List<Object> get props => [error];
}
