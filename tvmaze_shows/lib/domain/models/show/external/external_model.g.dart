// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExternalsAdapter extends TypeAdapter<Externals> {
  @override
  final int typeId = 8;

  @override
  Externals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Externals(
      tvrage: fields[0] as int?,
      thetvdb: fields[1] as int?,
      imdb: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Externals obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.tvrage)
      ..writeByte(1)
      ..write(obj.thetvdb)
      ..writeByte(2)
      ..write(obj.imdb);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExternalsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
