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
    final response = await _remotePeopleDataSource.getPeople();
    return (response.data as List).map((e) => PeopleModel.fromJson(e)).toList();
  }

  @override
  Future<List<PeopleModel>> getPeopleSearch(String query) async {
    final response = await _remotePeopleDataSource.getPeopleSearch(query);
    final List<PeopleModel> peoples = [];
    for (final data in response.data!) {
      final people = data['person'];
      peoples.add(PeopleModel.fromJson(people as Map<String, dynamic>));
    }
    return peoples;
  }
}
