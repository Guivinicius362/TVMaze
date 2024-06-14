import 'package:tvmaze_core/tvmaze_core.dart';

abstract class RemoteShowDataSource {
  Future<Response<List<dynamic>>> getShows(int page);
  Future<Response<List<dynamic>>> searchShow(String query);
}

class RemoteShowDataSourceImpl implements RemoteShowDataSource {
  RemoteShowDataSourceImpl();

  final Dio dio = GetIt.instance<Dio>();

  @override
  Future<Response<List<dynamic>>> getShows(int page) async {
    try {
      return await dio.get('/shows?page=$page');
    } catch (e) {
      // (TODO) handle error
      rethrow;
    }
  }

  @override
  Future<Response<List<dynamic>>> searchShow(String query) async {
    try {
      return await dio.get('/search/shows?q=$query');
    } catch (e) {
      // (TODO) handle error
      rethrow;
    }
  }
}
