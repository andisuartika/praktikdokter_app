import 'dart:convert';

class HistoryResponseModel {
  Meta? meta;
  List<History>? data;

  HistoryResponseModel({
    this.meta,
    this.data,
  });

  factory HistoryResponseModel.fromJson(String str) =>
      HistoryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryResponseModel.fromMap(Map<String, dynamic> json) =>
      HistoryResponseModel(
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
        data: json["data"] == null
            ? []
            : List<History>.from(json["data"]!.map((x) => History.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "meta": meta?.toMap(),
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class History {
  DateTime? tanggal;
  String? nama;
  int? umur;
  String? alamat;
  String? keluhan;
  String? tekananDarah;
  String? nadi;
  String? rr;
  String? suhu;
  String? fisik;
  String? diagnosis;
  String? tataLaksana;
  String? tarif;
  int? rujuk;

  History({
    this.tanggal,
    this.nama,
    this.umur,
    this.alamat,
    this.keluhan,
    this.tekananDarah,
    this.nadi,
    this.rr,
    this.suhu,
    this.fisik,
    this.diagnosis,
    this.tataLaksana,
    this.tarif,
    this.rujuk,
  });

  factory History.fromJson(String str) => History.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory History.fromMap(Map<String, dynamic> json) => History(
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        nama: json["nama"],
        umur: json["umur"],
        alamat: json["alamat"],
        keluhan: json["keluhan"],
        tekananDarah: json["tekanan_darah"],
        nadi: json["nadi"],
        rr: json["rr"],
        suhu: json["suhu"],
        fisik: json["fisik"],
        diagnosis: json["diagnosis"],
        tataLaksana: json["tata_laksana"],
        tarif: json["tarif"],
        rujuk: json["rujuk"],
      );

  Map<String, dynamic> toMap() => {
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "nama": nama,
        "umur": umur,
        "alamat": alamat,
        "keluhan": keluhan,
        "tekanan_darah": tekananDarah,
        "nadi": nadi,
        "rr": rr,
        "suhu": suhu,
        "fisik": fisik,
        "diagnosis": diagnosis,
        "tata_laksana": tataLaksana,
        "tarif": tarif,
        "rujuk": rujuk,
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
