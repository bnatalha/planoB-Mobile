// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_hm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionHMAdapter extends TypeAdapter<TransactionHM> {
  @override
  final int typeId = 11;

  @override
  TransactionHM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionHM(
      id: fields[0] as int,
      accountId: fields[3] as int,
      fromUserId: fields[1] as int,
      toUserId: fields[2] as int,
      value: fields[4] as double,
      description: fields[5] as String,
      tags: (fields[6] as List)?.cast<String>(),
      category: fields[7] as CategoryModel,
      date: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionHM obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fromUserId)
      ..writeByte(2)
      ..write(obj.toUserId)
      ..writeByte(3)
      ..write(obj.accountId)
      ..writeByte(4)
      ..write(obj.value)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.tags)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionHMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
