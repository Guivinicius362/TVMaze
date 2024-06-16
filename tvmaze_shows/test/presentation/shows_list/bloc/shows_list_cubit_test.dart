import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/domain/use_cases/get_shows_by_page_use_case.dart';
import 'package:tvmaze_shows/domain/use_cases/search_show_by_query_use_case.dart';
import 'package:tvmaze_shows/presentation/shows_list/bloc/shows_list_cubit.dart';

import '../../../domain/mock_show_model.dart';

class MockGetShowsByPageUseCase extends Mock implements GetShowsByPageUseCase {}

class MockSearchShowByQueryUseCase extends Mock
    implements SearchShowByQueryUseCase {}

void main() {
  late ShowsListCubit cubit;
  late MockGetShowsByPageUseCase getShowsByPageUseCase;
  late MockSearchShowByQueryUseCase searchShowByQueryUseCase;

  setUp(() {
    getShowsByPageUseCase = MockGetShowsByPageUseCase();
    searchShowByQueryUseCase = MockSearchShowByQueryUseCase();

    GetIt.instance
        .registerSingleton<GetShowsByPageUseCase>(getShowsByPageUseCase);
    GetIt.instance
        .registerSingleton<SearchShowByQueryUseCase>(searchShowByQueryUseCase);

    cubit = ShowsListCubit();
  });

  tearDown(() {
    GetIt.instance.unregister<GetShowsByPageUseCase>();
    GetIt.instance.unregister<SearchShowByQueryUseCase>();
    cubit.close();
  });

  blocTest<ShowsListCubit, ShowsListState>(
    'emits [ShowsListLoading, ShowsListLoaded] when init is successful',
    build: () {
      when(() => getShowsByPageUseCase(0))
          .thenAnswer((_) async => [showModelMock]);
      return cubit;
    },
    act: (cubit) => cubit.init(),
    expect: () => <ShowsListState>[
      ShowsListLoaded([showModelMock], 0),
    ],
  );

  blocTest<ShowsListCubit, ShowsListState>(
    'emits [ShowsListLoading, ShowsListLoaded] when onSearchChanged is successful',
    build: () {
      when(() => searchShowByQueryUseCase(any()))
          .thenAnswer((_) async => [showModelMock]);
      return cubit;
    },
    wait: const Duration(seconds: 1),
    act: (cubit) => cubit.onSearchChanged('123'),
    expect: () => <ShowsListState>[
      const ShowsListLoading(),
      ShowsListLoaded([showModelMock], 0),
    ],
  );

  blocTest<ShowsListCubit, ShowsListState>(
    'emits [ShowsListLoading, ShowsListError] when onSearchChanged fails',
    build: () {
      when(() => searchShowByQueryUseCase(any()))
          .thenThrow(Exception('Error loading shows'));
      return cubit;
    },
    act: (cubit) => cubit.onSearchChanged('123'),
    wait: const Duration(seconds: 1),
    expect: () => <ShowsListState>[
      const ShowsListLoading(),
      const ShowsListError('Exception: Error loading shows'),
    ],
  );

  blocTest<ShowsListCubit, ShowsListState>(
    'emits [ShowsListError] when init fails',
    build: () {
      when(() => getShowsByPageUseCase(any()))
          .thenAnswer((_) async => [showModelMock]);
      return cubit;
    },
    act: (cubit) => cubit.init(),
    expect: () => <ShowsListState>[
      ShowsListLoaded([showModelMock], 0),
    ],
  );
}
