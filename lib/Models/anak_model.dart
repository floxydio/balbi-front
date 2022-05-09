// To parse this JSON data, do
//
//     final anakModel = anakModelFromJson(jsonString);

import 'dart:convert';

AnakModel anakModelFromJson(String str) => AnakModel.fromJson(json.decode(str));

String anakModelToJson(AnakModel data) => json.encode(data.toJson());

class AnakModel {
  AnakModel({
    this.id,
    this.userid,
    this.gender,
    this.namaanak,
    this.namapanggilan,
    this.tanggallahir,
    this.panjangbadan,
    this.lingkarkepala,
    this.beratbadan,
  });

  int? id;
  int? userid;
  int? gender;
  String? namaanak;
  String? namapanggilan;
  String? tanggallahir;
  int? panjangbadan;
  int? lingkarkepala;
  int? beratbadan;

  factory AnakModel.fromJson(Map<String, dynamic> json) => AnakModel(
        id: json["id"],
        userid: json["userid"],
        gender: json["gender"],
        namaanak: json["namaanak"],
        namapanggilan: json["namapanggilan"],
        tanggallahir: json["tanggallahir"],
        panjangbadan: json["panjangbadan"],
        lingkarkepala: json["lingkarkepala"],
        beratbadan: json["beratbadan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userid": userid,
        "gender": gender,
        "namaanak": namaanak,
        "namapanggilan": namapanggilan,
        "tanggallahir": tanggallahir,
        "panjangbadan": panjangbadan,
        "lingkarkepala": lingkarkepala,
        "beratbadan": beratbadan,
      };
}
