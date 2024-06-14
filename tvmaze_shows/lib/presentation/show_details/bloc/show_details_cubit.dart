import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/season/season_model.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/domain/use_cases/get_seasons_by_show_use_case.dart';

part 'show_details_state.dart';

class ShowDetailsCubit extends Cubit<ShowDetailsState> {
  ShowDetailsCubit() : super(ShowDetailsInitial());

  final _getSeasonsByShow = GetIt.instance<GetSeasonsByShowUseCase>();

  Future<void> init(ShowModel currentShow) async {
    emit(ShowDetailsLoading(show: currentShow));
    if (currentShow.id == null) {
      emit(const ShowDetailsError(error: 'Show id is null'));
      return;
    }
    try {
      final seasons = await _getSeasonsByShow(currentShow.id!);
      emit(ShowDetailsLoaded(show: currentShow, seasons: seasons));
    } on Exception catch (e) {
      emit(ShowDetailsError(error: e.toString()));
    }
  }

  void selectSeason(int index) {
    final currentState = state;
    if (currentState is ShowDetailsLoaded) {
      emit(currentState.copyWith(selectedSeasonIndex: index));
    }
  }
}
