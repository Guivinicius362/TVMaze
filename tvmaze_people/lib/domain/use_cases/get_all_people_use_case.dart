import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_people/domain/models/people_model.dart';
import 'package:tvmaze_people/domain/repositories/people_repository.dart';

class GetAllPeopleUseCase {
  GetAllPeopleUseCase();

  final _peopleRepository = GetIt.instance<PeopleRepository>();

  Future<List<PeopleModel>> call() {
    return _peopleRepository.getPeople();
  }
}
