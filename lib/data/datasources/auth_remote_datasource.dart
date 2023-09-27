import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:praktik_dokter/data/common/global_variables.dart';
import 'package:praktik_dokter/data/datasources/auth_local_datasource.dart';
import 'package:praktik_dokter/data/models/response/auth_response_model.dart';
import 'package:praktik_dokter/data/models/request/login_request_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel model) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    final response = await http.post(
        Uri.parse("${GlobalVariables.baseUrl}/api/login"),
        headers: headers,
        body: model.toJson());

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      final mess = jsonDecode(response.body)['message'];
      return Left(mess);
    }
  }

  Future<Either<String, String>> logout() async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.post(
      Uri.parse("${GlobalVariables.baseUrl}/api/logout"),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final mess = jsonDecode(response.body)['message'];
      return Right(mess);
    } else {
      final mess = jsonDecode(response.body)['message'];
      return Left(mess);
    }
  }
}
