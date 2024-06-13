import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/domain/use_cases/get_shows_by_page_use_case.dart';

part 'shows_list_state.dart';

class ShowsListCubit extends Cubit<ShowsListState> {
  ShowsListCubit() : super(const ShowsListLoading());

  final _getShowsByPageUseCase = GetIt.instance<GetShowsByPageUseCase>();

  Future<void> init() async {
    try {
      final shows = await _getShowsByPageUseCase(0);
      emit(ShowsListLoaded(shows, 0));
    } catch (e) {
      emit(ShowsListError(e.toString()));
    }
  }

  Future<void> getShows() async {
    if (state is ShowsListLoaded) {
      final currentPage = (state as ShowsListLoaded).page + 1;
      final cubitShows = (state as ShowsListLoaded).shows;
      try {
        final shows = await _getShowsByPageUseCase(currentPage);
        emit(ShowsListLoaded([...cubitShows, ...shows], currentPage));
      } catch (e) {
        emit(ShowsListError(e.toString()));
      }
    }
  }
}
