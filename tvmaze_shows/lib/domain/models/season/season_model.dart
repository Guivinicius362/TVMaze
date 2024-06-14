import 'package:json_annotation/json_annotation.dart';
import 'package:tvmaze_core/domain/models/episode/episode_model.dart';
import 'package:tvmaze_core/domain/models/hero_image/image_model.dart';
import 'package:tvmaze_core/domain/models/links/links_model.dart';
import 'package:tvmaze_shows/domain/models/network/network_model.dart';

part 'season_model.g.dart';

@JsonSerializable()
class SeasonModel {
  final int? id;
  final String? url;
  final int? number;
  final String? name;
  final int? episodeOrder;
  final String? premiereDate;
  final String? endDate;
  final Network? network;
  final HeroImage? image;
  final String? summary;
  final Links? links;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<EpisodeModel> episodes;

  SeasonModel({
    this.id,
    this.url,
    this.number,
    this.name,
    this.episodeOrder,
    this.premiereDate,
    this.endDate,
    this.network,
    this.image,
    this.summary,
    this.links,
    this.episodes = const [],
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonModelToJson(this);

  SeasonModel copyWith({
    int? id,
    String? url,
    int? number,
    String? name,
    int? episodeOrder,
    String? premiereDate,
    String? endDate,
    Network? network,
    HeroImage? image,
    String? summary,
    Links? links,
    List<EpisodeModel>? episodes,
  }) {
    return SeasonModel(
      id: id ?? this.id,
      url: url ?? this.url,
      number: number ?? this.number,
      name: name ?? this.name,
      episodeOrder: episodeOrder ?? this.episodeOrder,
      premiereDate: premiereDate ?? this.premiereDate,
      endDate: endDate ?? this.endDate,
      network: network ?? this.network,
      image: image ?? this.image,
      summary: summary ?? this.summary,
      links: links ?? this.links,
      episodes: episodes ?? this.episodes,
    );
  }
}
