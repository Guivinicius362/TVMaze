import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/domain/use_cases/get_shows_by_page_use_case.dart';

part 'shows_list_state.dart';

class ShowsListCubit extends Cubit<ShowsListState> {
  ShowsListCubit() : super(const ShowsListLoading());

  final _getShowsByPageUseCase = GetIt.instance<GetShowsByPageUseCase>();

  Future<void> getShows({int? page}) async {
    emit(const ShowsListLoading());
    try {
      final shows = await _getShowsByPageUseCase(page ?? 0);
      emit(ShowsListLoaded(shows));
    } catch (e) {
      emit(ShowsListError(e.toString()));
    }
  }
}
