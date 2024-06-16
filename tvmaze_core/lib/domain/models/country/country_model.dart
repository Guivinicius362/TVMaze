import 'package:tvmaze_core/tvmaze_core.dart';

part 'country_model.g.dart';

@JsonSerializable()
@HiveType(typeId: TVMazeHiveKeys.countryTypeId)
class Country {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String code;
  @HiveField(2)
  final String timezone;

  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
