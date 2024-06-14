// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonModel _$SeasonModelFromJson(Map<String, dynamic> json) => SeasonModel(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      number: (json['number'] as num?)?.toInt(),
      name: json['name'] as String?,
      episodeOrder: (json['episodeOrder'] as num?)?.toInt(),
      premiereDate: json['premiereDate'] as String?,
      endDate: json['endDate'] as String?,
      network: json['network'] == null
          ? null
          : Network.fromJson(json['network'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : HeroImage.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SeasonModelToJson(SeasonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'number': instance.number,
      'name': instance.name,
      'episodeOrder': instance.episodeOrder,
      'premiereDate': instance.premiereDate,
      'endDate': instance.endDate,
      'network': instance.network,
      'image': instance.image,
      'summary': instance.summary,
      'links': instance.links,
    };
