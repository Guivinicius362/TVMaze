import 'package:tvmaze_core/domain/models/episode/episode_model.dart';
import 'package:tvmaze_core/domain/models/hero_image/image_model.dart';
import 'package:tvmaze_core/domain/models/links/links_model.dart';
import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/domain/models/network/network_model.dart';

part 'season_model.g.dart';

@JsonSerializable()
@HiveType(typeId: TVMazeHiveKeys.seasonTypeId)
class SeasonModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? url;
  @HiveField(2)
  final int? number;
  @HiveField(3)
  final String? name;
  @HiveField(4)
  final int? episodeOrder;
  @HiveField(5)
  final String? premiereDate;
  @HiveField(6)
  final String? endDate;
  @HiveField(7)
  final Network? network;
  @HiveField(8)
  final HeroImage? image;
  @HiveField(9)
  final String? summary;
  @HiveField(10)
  final Links? links;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @HiveField(11)
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
