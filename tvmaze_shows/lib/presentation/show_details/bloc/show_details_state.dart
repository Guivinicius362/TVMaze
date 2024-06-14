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

  const ShowDetailsLoaded({
    required this.show,
    required this.seasons,
    this.selectedSeasonIndex = 0,
  });

  @override
  List<Object> get props => [show, seasons, selectedSeasonIndex];

  ShowDetailsLoaded copyWith({
    ShowModel? show,
    List<SeasonModel>? seasons,
    int? selectedSeasonIndex,
  }) {
    return ShowDetailsLoaded(
      show: show ?? this.show,
      seasons: seasons ?? this.seasons,
      selectedSeasonIndex: selectedSeasonIndex ?? this.selectedSeasonIndex,
    );
  }
}

class ShowDetailsError extends ShowDetailsState {
  final String error;

  const ShowDetailsError({required this.error});

  @override
  List<Object> get props => [error];
}
