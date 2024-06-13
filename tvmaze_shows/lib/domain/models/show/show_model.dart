import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/external/external_model.dart';
import 'package:tvmaze_shows/domain/models/links/links_model.dart';
import 'package:tvmaze_shows/domain/models/network/network_model.dart';
import 'package:tvmaze_shows/domain/models/rating/rating_model.dart';
import 'package:tvmaze_shows/domain/models/schedule/schedule_model.dart';
import 'package:tvmaze_shows/domain/models/show_image/image_model.dart';

part 'show_model.g.dart';

@JsonSerializable()
class ShowModel {
  final int id;
  final String url;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int runtime;
  final int averageRuntime;
  final String premiered;
  final String? ended;
  final String? officialSite;
  final Schedule schedule;
  final Rating rating;
  final int weight;
  final Network network;
  final Externals externals;
  @JsonKey(name: 'image')
  final ShowImage image;
  final String summary;
  final int updated;
  final Links links;

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
