import 'dart:async';

import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_people/domain/models/people_model.dart';
import 'package:tvmaze_people/domain/use_cases/get_all_people_use_case.dart';
import 'package:tvmaze_people/domain/use_cases/get_people_by_query_use_case.dart';

part 'people_list_state.dart';

class PeopleListCubit extends Cubit<PeopleListState> {
  PeopleListCubit() : super(const PeopleListLoading());

  final _getAllPeopleUseCase = GetIt.instance<GetAllPeopleUseCase>();
  final _getPeopleByQueryUseCase = GetIt.instance<GetPeopleByQueryUseCase>();
  Timer? _debounce;

  Future<void> getAllPeople() async {
    try {
      final people = await _getAllPeopleUseCase();
      emit(PeopleListLoaded(people));
    } catch (e) {
      emit(PeopleListError(e.toString()));
    }
  }

  Future<void> _searchPeople(String query) async {
    try {
      final people = await _getPeopleByQueryUseCase(query);
      emit(PeopleListLoaded(people));
    } catch (e) {
      emit(PeopleListError(e.toString()));
    }
  }

  void onSearchChanged(String searchText) {
    emit(const PeopleListLoading());
    if (searchText.isEmpty) {
      _debounce?.cancel();
      getAllPeople();
      return;
    }
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      _searchPeople(searchText);
    });
  }
}
