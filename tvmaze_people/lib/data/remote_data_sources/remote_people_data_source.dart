import 'package:tvmaze_core/tvmaze_core.dart';

abstract class RemotePeopleDataSource {
  Future<Response<List<dynamic>>> getPeople();
  Future<Response<List<dynamic>>> getPeopleSearch(String query);
}

class RemotePeopleDataSourceImpl implements RemotePeopleDataSource {
  final _dio = GetIt.instance<Dio>();

  @override
  Future<Response<List<dynamic>>> getPeople() async {
    try {
      return await _dio.get('/people');
    } catch (e) {
      // (TODO) handle error
      rethrow;
    }
  }

  @override
  Future<Response<List>> getPeopleSearch(String query) {
    try {
      return _dio.get('/search/people?q=$query');
    } catch (e) {
      rethrow;
    }
  }
}
