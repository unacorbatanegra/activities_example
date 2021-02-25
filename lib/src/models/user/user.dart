import '../role/role.dart';

class User {
  final String email;
  final String user;
  final String name;
  final String lastName;
  final String dni;
  final String phone;
  final String uid;
  final String urlImg;
  final bool block;
  final Role role;

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
    this.role = Role.volunter,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'] as String,
        user: json['user'] as String,
        name: json['name'] as String,
        lastName: json['lastName'] as String,
        dni: json['dni'] as String,
        phone: json['telefono'] as String,
        uid: json['uid'] as String,
        urlImg: json['urlImg'] as String,
        block: json['block'] as bool,
        role: Role.values[json['role'] as int],
      );

  factory User.fromJsonOrg(Map<String, dynamic> json) => User(
        urlImg: json['urlImg'] as String,
        email: json['email'] as String,
        user: json['user'] as String,
        name: json['name'] as String,
        uid: json['uid'] as String,
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
        'role': role.index,
      };
}
