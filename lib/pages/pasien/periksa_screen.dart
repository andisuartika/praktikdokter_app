// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:praktik_dokter/data/models/response/pasien_response_model.dart';

import '../responsive/responsive.dart';
import 'mobile/periksa_mobile_screen.dart';
import 'tablet/periksa_tab_screen.dart';

class PeriksaScreen extends StatelessWidget {
  final Pasien pasien;
  const PeriksaScreen({
    Key? key,
    required this.pasien,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ResponsiveLayout(
        mobileLayout: PeriksaMobileScreen(
          pasien: pasien,
        ),
        tabletLayout: PeriksaTabScreen(),
      ),
    );
  }
}
