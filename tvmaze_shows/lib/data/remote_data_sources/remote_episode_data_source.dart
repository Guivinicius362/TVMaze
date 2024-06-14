import 'package:tvmaze_core/tvmaze_core.dart';

abstract class RemoteEpisodeDataSource {
  Future<Response<List<dynamic>>> getEpisodes(int showId);
}

class RemoteEpisodeDataSourceImpl implements RemoteEpisodeDataSource {
  RemoteEpisodeDataSourceImpl();

  final Dio dio = GetIt.instance<Dio>();

  @override
  Future<Response<List<dynamic>>> getEpisodes(int showId) async {
    try {
      return await dio.get('/shows/$showId/episodes');
    } catch (e) {
      // (TODO) handle error
      rethrow;
    }
  }
}
