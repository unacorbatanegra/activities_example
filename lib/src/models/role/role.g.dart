// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoleAdapter extends TypeAdapter<Role> {
  @override
  final int typeId = 1;

  @override
  Role read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Role.organization;
      case 1:
        return Role.volunter;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, Role obj) {
    switch (obj) {
      case Role.organization:
        writer.writeByte(0);
        break;
      case Role.volunter:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
