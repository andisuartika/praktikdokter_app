import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:praktik_dokter/data/models/request/periksa_request_model.dart';
import 'package:praktik_dokter/data/models/response/periksa_response_model.dart';
import 'package:http/http.dart' as http;

import '../common/global_variables.dart';
import 'auth_local_datasource.dart';

class PeriksaRemoteDatasource {
  Future<Either<String, PeriksaResponseModel>> storePeriksa(
      PeriksaRequestModel model) async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.post(
      Uri.parse('${GlobalVariables.baseUrl}/api/store-periksa'),
      headers: headers,
      body: model.toJson(),
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      return Right(PeriksaResponseModel.fromJson(response.body));
    } else {
      final mess = jsonDecode(response.body)['message'];
      return Left(mess);
    }
  }
}
