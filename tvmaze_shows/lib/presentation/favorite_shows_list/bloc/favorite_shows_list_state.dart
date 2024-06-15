part of 'favorite_shows_list_cubit.dart';

abstract class FavoriteShowsListState extends Equatable {
  const FavoriteShowsListState();
}

class FavoriteShowsListLoading extends FavoriteShowsListState {
  const FavoriteShowsListLoading();

  @override
  List<Object> get props => [];
}

class FavoriteShowsListLoaded extends FavoriteShowsListState {
  final List<ShowModel> shows;

  const FavoriteShowsListLoaded(
    this.shows,
  );

  @override
  List<Object> get props => [shows];
}

class FavoriteShowsListError extends FavoriteShowsListState {
  final String message;

  const FavoriteShowsListError(this.message);

  @override
  List<Object> get props => [message];
}
