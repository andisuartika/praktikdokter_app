import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:praktik_dokter/data/models/request/pasien_request_model.dart';
import 'package:praktik_dokter/data/models/response/pasien_response_model.dart';
import 'package:http/http.dart' as http;

import '../common/global_variables.dart';
import 'auth_local_datasource.dart';

class PasienRemoteDatasource {
  Future<Either<String, PasienResponseModel>> storePasien(
      PasienRequestModel model) async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.post(
      Uri.parse('${GlobalVariables.baseUrl}/api/store-pasien'),
      headers: headers,
      body: model.toJson(),
    );

    print(response.body);

    if (response.statusCode == 200) {
      return Right(PasienResponseModel.fromJson(response.body));
    } else {
      final mess = jsonDecode(response.body)['message'];
      return Left(mess);
    }
  }

  Future<Either<String, PasienResponseModel>> getPasien(int pasienId) async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/get-pasien?id=$pasienId'),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return Right(PasienResponseModel.fromJson(response.body));
    } else {
      final mess = jsonDecode(response.body)['message'];
      return Left(mess);
    }
  }

  Future<Either<String, PasienResponseModel>> searchPasien(String query) async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/get-pasien?nama=$query'),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return Right(PasienResponseModel.fromJson(response.body));
    } else {
      final mess = jsonDecode(response.body)['message'];
      return Left(mess);
    }
  }
}
