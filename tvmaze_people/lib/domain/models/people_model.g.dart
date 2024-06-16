// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeopleModel _$PeopleModelFromJson(Map<String, dynamic> json) => PeopleModel(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      name: json['name'] as String?,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      birthday: json['birthday'] as String?,
      deathday: json['deathday'] as String?,
      gender: json['gender'] as String?,
      image: json['image'] == null
          ? null
          : HeroImage.fromJson(json['image'] as Map<String, dynamic>),
      updated: (json['updated'] as num?)?.toInt(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PeopleModelToJson(PeopleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'country': instance.country,
      'birthday': instance.birthday,
      'deathday': instance.deathday,
      'gender': instance.gender,
      'image': instance.image,
      'updated': instance.updated,
      'links': instance.links,
    };

Self _$SelfFromJson(Map<String, dynamic> json) => Self(
      href: json['href'] as String?,
    );

Map<String, dynamic> _$SelfToJson(Self instance) => <String, dynamic>{
      'href': instance.href,
    };
