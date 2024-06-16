import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_people/data/remote_data_sources/remote_people_data_source.dart';
import 'package:tvmaze_people/domain/models/people_model.dart';

abstract class PeopleRepository {
  Future<List<PeopleModel>> getPeople();
  Future<List<PeopleModel>> getPeopleSearch(String query);
}

class PeopleRepositoryImpl implements PeopleRepository {
  PeopleRepositoryImpl();

  final _remotePeopleDataSource = GetIt.instance<RemotePeopleDataSource>();

  @override
  Future<List<PeopleModel>> getPeople() async {
    try {
      final response = await _remotePeopleDataSource.getPeople();
      return (response.data as List)
          .map((e) => PeopleModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      if (e.response != null) {
        throw TVMazeServerError(e.response!.statusMessage!);
      } else {
        throw TVMazeNetworkError(e.message ?? 'Network error');
      }
    } catch (e) {
      throw TVMazeUnknownError(e.toString());
    }
  }

  @override
  Future<List<PeopleModel>> getPeopleSearch(String query) async {
    try {
      final response = await _remotePeopleDataSource.getPeopleSearch(query);
      final List<PeopleModel> peopleList = [];
      for (final data in response.data!) {
        final people = data['person'];
        peopleList.add(PeopleModel.fromJson(people as Map<String, dynamic>));
      }
      return peopleList;
    } on DioException catch (e) {
      if (e.response != null) {
        throw TVMazeServerError(e.response!.statusMessage!);
      } else {
        throw TVMazeNetworkError(e.message ?? 'Network error');
      }
    } catch (e) {
      throw TVMazeUnknownError(e.toString());
    }
  }
}
