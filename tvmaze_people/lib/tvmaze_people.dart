import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_people/data/remote_data_sources/remote_people_data_source.dart';
import 'package:tvmaze_people/domain/repositories/people_repository.dart';
import 'package:tvmaze_people/domain/use_cases/get_all_people_use_case.dart';
import 'package:tvmaze_people/domain/use_cases/get_people_by_query_use_case.dart';
import 'package:tvmaze_people/presentation/people_list/bloc/people_list_cubit.dart';

export 'package:tvmaze_people/presentation/people_list/people_list_page.dart';

final _getIt = GetIt.instance;

Future<void> initPeopleDepedencies() async {
  _initDataSources();
  _initRepositories();
  _initUseCases();
  _initCubits();
}

void _initDataSources() {
  _getIt.registerFactory<RemotePeopleDataSource>(
      () => RemotePeopleDataSourceImpl());
}

void _initRepositories() {
  _getIt.registerFactory<PeopleRepository>(() => PeopleRepositoryImpl());
}

void _initUseCases() {
  _getIt.registerFactory<GetAllPeopleUseCase>(() => GetAllPeopleUseCase());
  _getIt.registerFactory<GetPeopleByQueryUseCase>(
      () => GetPeopleByQueryUseCase());
}

void _initCubits() {
  _getIt.registerFactory<PeopleListCubit>(() => PeopleListCubit());
}
