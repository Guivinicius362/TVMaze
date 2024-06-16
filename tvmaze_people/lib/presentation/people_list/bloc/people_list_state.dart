part of 'people_list_cubit.dart';

abstract class PeopleListState extends Equatable {
  const PeopleListState();
}

class PeopleListLoading extends PeopleListState {
  const PeopleListLoading();

  @override
  List<Object> get props => [];
}

class PeopleListLoaded extends PeopleListState {
  final List<PeopleModel> people;

  const PeopleListLoaded(this.people);

  @override
  List<Object> get props => [people];
}

class PeopleListError extends PeopleListState {
  final String message;

  const PeopleListError(this.message);

  @override
  List<Object> get props => [message];
}
