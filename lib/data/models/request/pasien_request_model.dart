import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PasienRequestModel {
  final String nama;
  final String jenisKelamin;
  final String tglLahir;
  final String alamat;
  PasienRequestModel({
    required this.nama,
    required this.jenisKelamin,
    required this.tglLahir,
    required this.alamat,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'jenis_kelamin': jenisKelamin,
      'tgl_lahir': tglLahir,
      'alamat': alamat,
    };
  }

  factory PasienRequestModel.fromMap(Map<String, dynamic> map) {
    return PasienRequestModel(
      nama: map['nama'] as String,
      jenisKelamin: map['jenis_kelamin'] as String,
      tglLahir: map['tgl_lahir'] as String,
      alamat: map['alamat'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PasienRequestModel.fromJson(String source) =>
      PasienRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
