// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      name: json['name'] as String?,
      season: (json['season'] as num?)?.toInt(),
      number: (json['number'] as num?)?.toInt(),
      type: json['type'] as String?,
      airdate: json['airdate'] as String?,
      airtime: json['airtime'] as String?,
      airstamp: json['airstamp'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      rating: json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : HeroImage.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'season': instance.season,
      'number': instance.number,
      'type': instance.type,
      'airdate': instance.airdate,
      'airtime': instance.airtime,
      'airstamp': instance.airstamp,
      'runtime': instance.runtime,
      'rating': instance.rating,
      'image': instance.image,
      'summary': instance.summary,
      'links': instance.links,
    };
