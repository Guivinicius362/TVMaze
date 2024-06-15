import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/country/country_model.dart';

part 'network_model.g.dart';

@JsonSerializable()
@HiveType(typeId: TVMazeHiveKeys.networkTypeId)
class Network {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final Country country;
  @HiveField(3)
  final String? officialSite;

  Network({
    required this.id,
    required this.name,
    required this.country,
    this.officialSite,
  });

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}
