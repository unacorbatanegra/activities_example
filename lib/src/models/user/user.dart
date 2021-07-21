import 'package:hive/hive.dart';

import '../role/role.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String? email;
  @HiveField(1)
  String? user;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? lastName;
  @HiveField(4)
  String? dni;
  @HiveField(5)
  String? phone;
  @HiveField(6)
  String? uid;
  @HiveField(7)
  String? urlImg;
  @HiveField(8)
  bool? block;
  @HiveField(9)
  Role? role;

  User({
    this.email,
    this.user,
    this.name,
    this.lastName,
    this.dni,
    this.phone,
    this.uid,
    this.block = false,
    this.urlImg,
    this.role,
  });

  static User fromJson(Map<String, dynamic> map) => User(
        email: map['email'] as String?,
        user: map['user'] as String?,
        name: map['name'] as String?,
        lastName: map['lastName'] as String?,
        dni: map['dni'] as String?,
        phone: map['telefono'] as String?,
        uid: map['uid'] as String?,
        urlImg: map['urlImg'] as String?,
        block: map['block'] as bool?,
        role: map['role'] != null ? Role.values[map['role'] as int] : null,
      );

  factory User.fromJsonOrg(Map<String, dynamic> json) => User(
        urlImg: json['urlImg'] as String?,
        email: json['email'] as String?,
        user: json['user'] as String?,
        name: json['name'] as String?,
        uid: json['uid'] as String?,
      );

  Map<String, dynamic> toJsonOrg() => {
        'email': email,
        'user': user,
        'name': name,
        'uid': uid,
        'urlImg': urlImg,
      };

  Map<String, dynamic> toJson() => {
        'email': email,
        'user': user,
        'name': name,
        'lastName': lastName,
        'dni': dni,
        'telefono': phone,
        'uid': uid,
        'block': block,
        'role': role?.index,
      };
}
