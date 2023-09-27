import 'dart:convert';

class PeriksaResponseModel {
  Meta? meta;
  List<Periksa>? data;

  PeriksaResponseModel({
    this.meta,
    this.data,
  });

  factory PeriksaResponseModel.fromJson(String str) =>
      PeriksaResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PeriksaResponseModel.fromMap(Map<String, dynamic> json) =>
      PeriksaResponseModel(
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
        data: json["data"] == null
            ? []
            : List<Periksa>.from(json["data"]!.map((x) => Periksa.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "meta": meta?.toMap(),
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Periksa {
  int? dokterId;
  int? pasienId;
  String? keluhan;
  String? tekananDarah;
  String? nadi;
  String? rr;
  String? suhu;
  String? fisik;
  String? diagnosis;
  String? tataLaksana;
  int? rujuk;
  int? tarif;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Periksa({
    this.dokterId,
    this.pasienId,
    this.keluhan,
    this.tekananDarah,
    this.nadi,
    this.rr,
    this.suhu,
    this.fisik,
    this.diagnosis,
    this.tataLaksana,
    this.rujuk,
    this.tarif,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Periksa.fromJson(String str) => Periksa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Periksa.fromMap(Map<String, dynamic> json) => Periksa(
        dokterId: json["dokter_id"],
        pasienId: json["pasien_id"],
        keluhan: json["keluhan"],
        tekananDarah: json["tekanan_darah"],
        nadi: json["nadi"],
        rr: json["rr"],
        suhu: json["suhu"],
        fisik: json["fisik"],
        diagnosis: json["diagnosis"],
        tataLaksana: json["tata_laksana"],
        rujuk: json["rujuk"],
        tarif: json["tarif"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "dokter_id": dokterId,
        "pasien_id": pasienId,
        "keluhan": keluhan,
        "tekanan_darah": tekananDarah,
        "nadi": nadi,
        "rr": rr,
        "suhu": suhu,
        "fisik": fisik,
        "diagnosis": diagnosis,
        "tata_laksana": tataLaksana,
        "rujuk": rujuk,
        "tarif": tarif,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
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
