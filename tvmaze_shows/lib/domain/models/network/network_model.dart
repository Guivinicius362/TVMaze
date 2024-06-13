import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/country/country_model.dart';

part 'network_model.g.dart';

@JsonSerializable()
class Network {
  final int id;
  final String name;
  final Country country;
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
