import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PeriksaRequestModel {
  final int pasienId;
  final String keluhan;
  final String tekananDarah;
  final String nadi;
  final String rr;
  final String suhu;
  final String fisik;
  final String diagnosis;
  final String tataLaksana;
  final int rujuk;
  final String tempat;
  final String keterangan;
  final int tarif;
  PeriksaRequestModel({
    required this.pasienId,
    required this.keluhan,
    required this.tekananDarah,
    required this.nadi,
    required this.rr,
    required this.suhu,
    required this.fisik,
    required this.diagnosis,
    required this.tataLaksana,
    required this.rujuk,
    required this.tempat,
    required this.keterangan,
    required this.tarif,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pasien_id': pasienId,
      'keluhan': keluhan,
      'tekanan_darah': tekananDarah,
      'nadi': nadi,
      'rr': rr,
      'suhu': suhu,
      'fisik': fisik,
      'diagnosis': diagnosis,
      'tata_laksana': tataLaksana,
      'rujuk': rujuk,
      'tempat': tempat,
      'keterangan': keterangan,
      'tarif': tarif,
    };
  }

  factory PeriksaRequestModel.fromMap(Map<String, dynamic> map) {
    return PeriksaRequestModel(
      pasienId: map['pasien_id'] as int,
      keluhan: map['keluhan'] as String,
      tekananDarah: map['tekanan_darah'] as String,
      nadi: map['nadi'] as String,
      rr: map['rr'] as String,
      suhu: map['suhu'] as String,
      fisik: map['fisik'] as String,
      diagnosis: map['diagnosis'] as String,
      tataLaksana: map['tata_laksana'] as String,
      rujuk: map['rujuk'] as int,
      tempat: map['tempat'] as String,
      keterangan: map['keterangan'] as String,
      tarif: map['tarif'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PeriksaRequestModel.fromJson(String source) =>
      PeriksaRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
