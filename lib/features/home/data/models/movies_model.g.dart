// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoviesModelAdapter extends TypeAdapter<MoviesModel> {
  @override
  final int typeId = 1;

  @override
  MoviesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      posterURL: fields[2] as String?,
      imdbId: fields[3] as String?,
      isFavourite: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MoviesModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterURL)
      ..writeByte(3)
      ..write(obj.imdbId)
      ..writeByte(4)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
