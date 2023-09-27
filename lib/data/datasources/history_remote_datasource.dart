import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:praktik_dokter/data/common/global_variables.dart';
import 'package:praktik_dokter/data/datasources/auth_local_datasource.dart';
import 'package:praktik_dokter/data/models/response/history_response_model.dart';

class HistoryRemoteDatasource {
  Future<Either<String, HistoryResponseModel>> getHistory() async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/get-history'),
      headers: headers,
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      return Right(HistoryResponseModel.fromJson(response.body));
    } else {
      final mess = jsonDecode(response.body)['message'];
      return Left(mess);
    }
  }

  Future<Either<String, HistoryResponseModel>> getHistoryPasien(
      int pasienId) async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(
      Uri.parse(
          '${GlobalVariables.baseUrl}/api/get-riwayat?pasien_id=$pasienId'),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return Right(HistoryResponseModel.fromJson(response.body));
    } else {
      final mess = jsonDecode(response.body)['message'];
      return Left(mess);
    }
  }
}
