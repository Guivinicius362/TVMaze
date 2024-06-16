import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/data/local_data_sources/local_show_data_source.dart';
import 'package:tvmaze_shows/data/remote_data_sources/remote_show_data_source.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';
import 'package:tvmaze_shows/domain/repositories/show_repository.dart';

class MockRemoteShowDataSource extends Mock implements RemoteShowDataSource {}

class MockLocalShowDataSource extends Mock implements LocalShowDataSource {}

void main() {
  late ShowRepositoryImpl repository;
  late MockRemoteShowDataSource mockRemoteShowDataSource;
  late MockLocalShowDataSource mockLocalShowDataSource;

  setUp(() {
    mockRemoteShowDataSource = MockRemoteShowDataSource();
    mockLocalShowDataSource = MockLocalShowDataSource();
    GetIt.instance
        .registerSingleton<RemoteShowDataSource>(mockRemoteShowDataSource);
    GetIt.instance
        .registerSingleton<LocalShowDataSource>(mockLocalShowDataSource);
    repository = ShowRepositoryImpl();
  });

  tearDown(() {
    GetIt.instance.unregister<RemoteShowDataSource>();
    GetIt.instance.unregister<LocalShowDataSource>();
  });

  group('Remote Data Sources', () {
    test(
        'returns a list of shows when the call to the remote data source is successful',
        () async {
      when(() => mockRemoteShowDataSource.getShows(any())).thenAnswer(
        (_) async => Response(
          data: [<String, dynamic>{}],
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await repository.getShows(0);

      expect(result, isA<List<ShowModel>>());
      verify(() => mockRemoteShowDataSource.getShows(0)).called(1);
    });

    test('throws an exception when the call to the remote data source fails',
        () async {
      when(() => mockRemoteShowDataSource.getShows(any()))
          .thenThrow(Exception());

      expect(
          () async => await repository.getShows(0), throwsA(isA<Exception>()));
    });
  });

  group('Local Data Source', () {
    test(
        'returns a list of shows when the call to the local data source is successful',
        () async {
      when(() => mockLocalShowDataSource.getFavoritesShows()).thenAnswer(
        (_) async => <ShowModel>[],
      );

      final result = await repository.getFavoritesShows();

      expect(result, isA<List<ShowModel>>());
      verify(() => mockLocalShowDataSource.getFavoritesShows()).called(1);
    });

    test('throws an exception when the call to the local data source fails',
        () async {
      when(() => mockLocalShowDataSource.getFavoritesShows()).thenThrow(
        Exception(),
      );

      expect(
        () async => await repository.getFavoritesShows(),
        throwsA(
          isA<Exception>(),
        ),
      );
    });
  });
}
