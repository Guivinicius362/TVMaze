// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Externals _$ExternalsFromJson(Map<String, dynamic> json) => Externals(
      tvrage: (json['tvrage'] as num?)?.toInt(),
      thetvdb: (json['thetvdb'] as num?)?.toInt(),
      imdb: json['imdb'] as String?,
    );

Map<String, dynamic> _$ExternalsToJson(Externals instance) => <String, dynamic>{
      'tvrage': instance.tvrage,
      'thetvdb': instance.thetvdb,
      'imdb': instance.imdb,
    };
