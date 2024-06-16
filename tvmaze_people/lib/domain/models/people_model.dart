import 'package:tvmaze_core/domain/models/country/country_model.dart';
import 'package:tvmaze_core/domain/models/hero_image/image_model.dart';
import 'package:tvmaze_core/domain/models/links/links_model.dart';
import 'package:tvmaze_core/tvmaze_core.dart';

part 'people_model.g.dart';

@JsonSerializable()
class PeopleModel {
  final int? id;
  final String? url;
  final String? name;
  final Country? country;
  final String? birthday;
  final String? deathday;
  final String? gender;
  final HeroImage? image;
  final int? updated;
  final Links? links;

  PeopleModel({
    this.id,
    this.url,
    this.name,
    this.country,
    this.birthday,
    this.deathday,
    this.gender,
    this.image,
    this.updated,
    this.links,
  });

  factory PeopleModel.fromJson(Map<String, dynamic> json) =>
      _$PeopleModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleModelToJson(this);
}

@JsonSerializable()
class Self {
  final String? href;

  Self({this.href});

  factory Self.fromJson(Map<String, dynamic> json) => _$SelfFromJson(json);

  Map<String, dynamic> toJson() => _$SelfToJson(this);
}
