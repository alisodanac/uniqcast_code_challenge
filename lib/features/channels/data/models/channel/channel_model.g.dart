// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChannelModelAdapter extends TypeAdapter<ChannelModel> {
  @override
  final int typeId = 0;

  @override
  ChannelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChannelModel(
      id: fields[0] as String,
      name: fields[1] as String,
      logo: fields[2] as String,
      url: fields[3] as String,
      programs: (fields[4] as List).cast<ProgramModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChannelModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.logo)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.programs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChannelModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChannelModelImpl _$$ChannelModelImplFromJson(Map<String, dynamic> json) =>
    _$ChannelModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
      url: json['url'] as String,
      programs: (json['programs'] as List<dynamic>?)
              ?.map((e) => ProgramModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChannelModelImplToJson(_$ChannelModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'url': instance.url,
      'programs': instance.programs,
    };
