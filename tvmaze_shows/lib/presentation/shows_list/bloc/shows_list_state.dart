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

  const ShowsListLoaded(this.shows);

  @override
  List<Object> get props => [shows];
}

class ShowsListError extends ShowsListState {
  final String message;

  const ShowsListError(this.message);

  @override
  List<Object> get props => [message];
}
