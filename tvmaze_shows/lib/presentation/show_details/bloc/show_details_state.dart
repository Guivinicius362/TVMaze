part of 'show_details_cubit.dart';

abstract class ShowDetailsState extends Equatable {
  const ShowDetailsState();

  @override
  List<Object> get props => [];
}

class ShowDetailsInitial extends ShowDetailsState {}

class ShowDetailsLoading extends ShowDetailsState {
  final ShowModel show;

  const ShowDetailsLoading({required this.show});

  @override
  List<Object> get props => [show];
}

class ShowDetailsLoaded extends ShowDetailsState {
  final ShowModel show;
  final List<SeasonModel> seasons;
  final int selectedSeasonIndex;
  final bool isFavorite;

  const ShowDetailsLoaded({
    required this.show,
    required this.seasons,
    required this.isFavorite,
    this.selectedSeasonIndex = 0,
  });

  @override
  List<Object> get props => [show, seasons, selectedSeasonIndex, isFavorite];

  ShowDetailsLoaded copyWith({
    ShowModel? show,
    List<SeasonModel>? seasons,
    int? selectedSeasonIndex,
    bool? isFavorite,
  }) {
    return ShowDetailsLoaded(
      show: show ?? this.show,
      seasons: seasons ?? this.seasons,
      selectedSeasonIndex: selectedSeasonIndex ?? this.selectedSeasonIndex,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class ShowDetailsError extends ShowDetailsState {
  final String error;

  const ShowDetailsError({required this.error});

  @override
  List<Object> get props => [error];
}
