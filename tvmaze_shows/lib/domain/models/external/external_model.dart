import 'package:tvmaze_core/tvmaze_core.dart';

part 'external_model.g.dart';

@JsonSerializable()
class Externals {
  final int? tvrage;
  final int? thetvdb;
  final String? imdb;

  Externals({this.tvrage, this.thetvdb, this.imdb});

  factory Externals.fromJson(Map<String, dynamic> json) =>
      _$ExternalsFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalsToJson(this);
}
