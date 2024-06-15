// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HeroImageAdapter extends TypeAdapter<HeroImage> {
  @override
  final int typeId = 0;

  @override
  HeroImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HeroImage(
      medium: fields[0] as String,
      original: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HeroImage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.medium)
      ..writeByte(1)
      ..write(obj.original);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HeroImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeroImage _$HeroImageFromJson(Map<String, dynamic> json) => HeroImage(
      medium: json['medium'] as String,
      original: json['original'] as String,
    );

Map<String, dynamic> _$HeroImageToJson(HeroImage instance) => <String, dynamic>{
      'medium': instance.medium,
      'original': instance.original,
    };
