// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShowModelAdapter extends TypeAdapter<ShowModel> {
  @override
  final int typeId = 7;

  @override
  ShowModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShowModel(
      id: fields[0] as int?,
      url: fields[1] as String?,
      name: fields[2] as String?,
      type: fields[3] as String?,
      language: fields[4] as String?,
      genres: (fields[5] as List?)?.cast<String>(),
      status: fields[6] as String?,
      runtime: fields[7] as int?,
      averageRuntime: fields[8] as int?,
      premiered: fields[9] as String?,
      ended: fields[10] as String?,
      officialSite: fields[11] as String?,
      schedule: fields[12] as Schedule?,
      rating: fields[13] as Rating?,
      weight: fields[14] as int?,
      network: fields[15] as Network?,
      externals: fields[16] as Externals?,
      image: fields[17] as HeroImage?,
      summary: fields[18] as String?,
      updated: fields[19] as int?,
      links: fields[20] as Links?,
    );
  }

  @override
  void write(BinaryWriter writer, ShowModel obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.language)
      ..writeByte(5)
      ..write(obj.genres)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.runtime)
      ..writeByte(8)
      ..write(obj.averageRuntime)
      ..writeByte(9)
      ..write(obj.premiered)
      ..writeByte(10)
      ..write(obj.ended)
      ..writeByte(11)
      ..write(obj.officialSite)
      ..writeByte(12)
      ..write(obj.schedule)
      ..writeByte(13)
      ..write(obj.rating)
      ..writeByte(14)
      ..write(obj.weight)
      ..writeByte(15)
      ..write(obj.network)
      ..writeByte(16)
      ..write(obj.externals)
      ..writeByte(17)
      ..write(obj.image)
      ..writeByte(18)
      ..write(obj.summary)
      ..writeByte(19)
      ..write(obj.updated)
      ..writeByte(20)
      ..write(obj.links);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShowModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowModel _$ShowModelFromJson(Map<String, dynamic> json) => ShowModel(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      language: json['language'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      averageRuntime: (json['averageRuntime'] as num?)?.toInt(),
      premiered: json['premiered'] as String?,
      ended: json['ended'] as String?,
      officialSite: json['officialSite'] as String?,
      schedule: json['schedule'] == null
          ? null
          : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
      rating: json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      weight: (json['weight'] as num?)?.toInt(),
      network: json['network'] == null
          ? null
          : Network.fromJson(json['network'] as Map<String, dynamic>),
      externals: json['externals'] == null
          ? null
          : Externals.fromJson(json['externals'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : HeroImage.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
      updated: (json['updated'] as num?)?.toInt(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShowModelToJson(ShowModel instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'type': instance.type,
      'language': instance.language,
      'genres': instance.genres,
      'status': instance.status,
      'runtime': instance.runtime,
      'averageRuntime': instance.averageRuntime,
      'premiered': instance.premiered,
      'ended': instance.ended,
      'officialSite': instance.officialSite,
      'schedule': instance.schedule,
      'rating': instance.rating,
      'weight': instance.weight,
      'network': instance.network,
      'externals': instance.externals,
      'image': instance.image,
      'summary': instance.summary,
      'updated': instance.updated,
      'links': instance.links,
    };
