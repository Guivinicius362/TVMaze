import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/presentation/shows_list/bloc/shows_list_cubit.dart';
import 'package:tvmaze_shows/presentation/shows_list/shows_list.dart';

import '../../custom_material_app_wrapper.dart';
import '../../domain/mock_show_model.dart';

class MockShowsListCubit extends MockCubit<ShowsListState>
    implements ShowsListCubit {}

void main() {
  late MockShowsListCubit mockShowsListCubit;

  setUp(() {
    mockShowsListCubit = MockShowsListCubit();
    GetIt.instance.registerSingleton<ShowsListCubit>(mockShowsListCubit);
  });

  tearDown(() {
    GetIt.instance.unregister<ShowsListCubit>();
  });

  testWidgets('ShowsList calls init when created', (WidgetTester tester) async {
    when(() => mockShowsListCubit.state).thenReturn(const ShowsListLoading());
    when(() => mockShowsListCubit.init()).thenAnswer((_) async {});

    await pumpWidgetWithMaterial(
      tester,
      const Scaffold(
        body: ShowsList(),
      ),
    );

    verify(() => mockShowsListCubit.init()).called(1);
  });

  testWidgets(
      'ShowsList displays loading indicator when state is ShowsListLoading',
      (WidgetTester tester) async {
    when(() => mockShowsListCubit.state).thenReturn(const ShowsListLoading());

    when(() => mockShowsListCubit.init()).thenAnswer((_) async {});

    await pumpWidgetWithMaterial(
      tester,
      const Scaffold(
        body: ShowsList(),
      ),
    );

    expect(find.byType(ShimmerShowList), findsOneWidget);
  });

  testWidgets(
      'ShowsList displays loading indicator when state is ShowsListLoading',
      (WidgetTester tester) async {
    when(() => mockShowsListCubit.state)
        .thenReturn(ShowsListLoaded([showModelMock], 0));

    when(() => mockShowsListCubit.init()).thenAnswer((_) async {});

    await pumpWidgetWithMaterial(
      tester,
      const Scaffold(
        body: ShowsList(),
      ),
    );

    expect(find.byType(GridView), findsOneWidget);
  });
}
