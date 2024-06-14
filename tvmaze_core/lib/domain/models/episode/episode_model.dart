import 'package:json_annotation/json_annotation.dart';
import 'package:tvmaze_core/domain/models/hero_image/image_model.dart';
import 'package:tvmaze_core/domain/models/links/links_model.dart';
import 'package:tvmaze_core/domain/models/rating/rating_model.dart';
part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
  final int? id;
  final String? url;
  final String? name;
  final int? season;
  final int? number;
  final String? type;
  final String? airdate;
  final String? airtime;
  final String? airstamp;
  final int? runtime;
  final Rating? rating;
  final HeroImage? image;
  final String? summary;
  final Links? links;

  EpisodeModel({
    this.id,
    this.url,
    this.name,
    this.season,
    this.number,
    this.type,
    this.airdate,
    this.airtime,
    this.airstamp,
    this.runtime,
    this.rating,
    this.image,
    this.summary,
    this.links,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
