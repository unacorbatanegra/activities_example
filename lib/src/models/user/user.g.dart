// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      email: fields[0] as String,
      user: fields[1] as String,
      name: fields[2] as String,
      lastName: fields[3] as String,
      dni: fields[4] as String,
      phone: fields[5] as String,
      uid: fields[6] as String,
      block: fields[8] as bool,
      urlImg: fields[7] as String,
      role: fields[9] as Role,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.dni)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.uid)
      ..writeByte(7)
      ..write(obj.urlImg)
      ..writeByte(8)
      ..write(obj.block)
      ..writeByte(9)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
