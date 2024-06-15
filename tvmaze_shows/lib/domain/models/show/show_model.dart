import 'package:tvmaze_core/domain/models/links/links_model.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/show/external/external_model.dart';
import 'package:tvmaze_shows/domain/models/network/network_model.dart';
import 'package:tvmaze_core/domain/models/rating/rating_model.dart';
import 'package:tvmaze_shows/domain/models/show/schedule/schedule_model.dart';
import 'package:tvmaze_core/domain/models/hero_image/image_model.dart';

part 'show_model.g.dart';

@JsonSerializable()
@HiveType(typeId: TVMazeHiveKeys.showTypeId)
class ShowModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? url;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? type;
  @HiveField(4)
  final String? language;
  @HiveField(5)
  final List<String>? genres;
  @HiveField(6)
  final String? status;
  @HiveField(7)
  final int? runtime;
  @HiveField(8)
  final int? averageRuntime;
  @HiveField(9)
  final String? premiered;
  @HiveField(10)
  final String? ended;
  @HiveField(11)
  final String? officialSite;
  @HiveField(12)
  final Schedule? schedule;
  @HiveField(13)
  final Rating? rating;
  @HiveField(14)
  final int? weight;
  @HiveField(15)
  final Network? network;
  @HiveField(16)
  final Externals? externals;
  @HiveField(17)
  @JsonKey(name: 'image')
  final HeroImage? image;
  @HiveField(18)
  final String? summary;
  @HiveField(19)
  final int? updated;
  @HiveField(20)
  final Links? links;

  ShowModel({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    this.ended,
    this.officialSite,
    required this.schedule,
    required this.rating,
    required this.weight,
    required this.network,
    required this.externals,
    required this.image,
    required this.summary,
    required this.updated,
    required this.links,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) =>
      _$ShowModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowModelToJson(this);
}
