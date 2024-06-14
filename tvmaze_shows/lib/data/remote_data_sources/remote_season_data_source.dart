import 'package:tvmaze_core/tvmaze_core.dart';

abstract class RemoteSeasonDataSource {
  Future<Response<List<dynamic>>> getSeasons(int showId);
}

class RemoteSeasonDataSourceImpl implements RemoteSeasonDataSource {
  RemoteSeasonDataSourceImpl();

  final Dio dio = GetIt.instance<Dio>();

  @override
  Future<Response<List<dynamic>>> getSeasons(int showId) async {
    try {
      return await dio.get('/shows/$showId/seasons');
    } catch (e) {
      // (TODO) handle error
      rethrow;
    }
  }
}
