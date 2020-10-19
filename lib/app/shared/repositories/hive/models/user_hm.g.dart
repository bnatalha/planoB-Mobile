// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHMAdapter extends TypeAdapter<UserHM> {
  @override
  final int typeId = 10;

  @override
  UserHM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHM(
      id: fields[0] as int,
      username: fields[1] as String,
      password: fields[2] as String,
      displayName: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserHM obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.displayName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
