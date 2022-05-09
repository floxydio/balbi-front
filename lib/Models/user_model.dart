import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.email,
    this.password,
    this.asal,
    this.username,
    this.idpertanyaan,
    this.jawaban,
    this.nama,
    this.phone,
  });

  String? email;
  String? password;
  String? asal;
  String? username;
  int? idpertanyaan;
  String? jawaban;
  String? nama;
  int? phone;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        asal: json["asal"],
        username: json["username"],
        idpertanyaan: json["idpertanyaan"],
        jawaban: json["jawaban"],
        nama: json["nama"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "asal": asal,
        "username": username,
        "idpertanyaan": idpertanyaan,
        "jawaban": jawaban,
        "nama": nama,
        "phone": phone,
      };
}
