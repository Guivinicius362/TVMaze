// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeasonModelAdapter extends TypeAdapter<SeasonModel> {
  @override
  final int typeId = 6;

  @override
  SeasonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeasonModel(
      id: fields[0] as int?,
      url: fields[1] as String?,
      number: fields[2] as int?,
      name: fields[3] as String?,
      episodeOrder: fields[4] as int?,
      premiereDate: fields[5] as String?,
      endDate: fields[6] as String?,
      network: fields[7] as Network?,
      image: fields[8] as HeroImage?,
      summary: fields[9] as String?,
      links: fields[10] as Links?,
      episodes: (fields[11] as List).cast<EpisodeModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, SeasonModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.number)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.episodeOrder)
      ..writeByte(5)
      ..write(obj.premiereDate)
      ..writeByte(6)
      ..write(obj.endDate)
      ..writeByte(7)
      ..write(obj.network)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.summary)
      ..writeByte(10)
      ..write(obj.links)
      ..writeByte(11)
      ..write(obj.episodes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeasonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
