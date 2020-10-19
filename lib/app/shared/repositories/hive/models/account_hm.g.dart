// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_hm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountHMAdapter extends TypeAdapter<AccountHM> {
  @override
  final int typeId = 12;

  @override
  AccountHM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountHM(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AccountHM obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.bankName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountHMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
