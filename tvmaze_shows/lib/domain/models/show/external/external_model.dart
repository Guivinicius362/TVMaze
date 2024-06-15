import 'package:tvmaze_core/tvmaze_core.dart';

part 'external_model.g.dart';

@JsonSerializable()
@HiveType(typeId: TVMazeHiveKeys.externalTypeId)
class Externals {
  @HiveField(0)
  final int? tvrage;
  @HiveField(1)
  final int? thetvdb;
  @HiveField(2)
  final String? imdb;

  Externals({this.tvrage, this.thetvdb, this.imdb});

  factory Externals.fromJson(Map<String, dynamic> json) =>
      _$ExternalsFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalsToJson(this);
}
