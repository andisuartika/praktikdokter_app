import 'dart:convert';

class PasienResponseModel {
  Meta? meta;
  List<Pasien>? data;

  PasienResponseModel({
    this.meta,
    this.data,
  });

  factory PasienResponseModel.fromJson(String str) =>
      PasienResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PasienResponseModel.fromMap(Map<String, dynamic> json) =>
      PasienResponseModel(
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
        data: json["data"] == null
            ? []
            : List<Pasien>.from(json["data"]!.map((x) => Pasien.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "meta": meta?.toMap(),
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Pasien {
  int? id;
  String? nama;
  String? jenisKelamin;
  DateTime? tglLahir;
  String? alamat;
  int? umur;

  Pasien({
    this.id,
    this.nama,
    this.jenisKelamin,
    this.tglLahir,
    this.alamat,
    this.umur,
  });

  factory Pasien.fromJson(String str) => Pasien.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pasien.fromMap(Map<String, dynamic> json) => Pasien(
        id: json["id"],
        nama: json["nama"],
        jenisKelamin: json["jenis_kelamin"],
        tglLahir: json["tgl_lahir"] == null
            ? null
            : DateTime.parse(json["tgl_lahir"]),
        alamat: json["alamat"],
        umur: json["umur"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
        "tgl_lahir":
            "${tglLahir!.year.toString().padLeft(4, '0')}-${tglLahir!.month.toString().padLeft(2, '0')}-${tglLahir!.day.toString().padLeft(2, '0')}",
        "alamat": alamat,
        "umur": umur,
      };
}

class Meta {
  int? code;
  String? status;
  String? message;

  Meta({
    this.code,
    this.status,
    this.message,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
