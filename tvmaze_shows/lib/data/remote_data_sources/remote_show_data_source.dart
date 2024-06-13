import 'package:tvmaze_core/tvmaze_core.dart';

abstract class RemoteShowDataSource {
  Future<Response<List<dynamic>>> getShows(int page);
}

class RemoteShowDataSourceImpl implements RemoteShowDataSource {
  RemoteShowDataSourceImpl();

  final Dio dio = GetIt.instance<Dio>();

  @override
  Future<Response<List<dynamic>>> getShows(int page) async {
    try {
      return await dio.get('/shows?page=$page');
    } catch (e) {
      // todo handle error
      rethrow;
    }
  }
}
