// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:praktik_dokter/data/models/response/pasien_response_model.dart';
import 'package:praktik_dokter/pages/pasien/periksa_screen.dart';

import '../../../theme.dart';

class PasienWidget extends StatelessWidget {
  final Pasien pasien;
  const PasienWidget({
    Key? key,
    required this.pasien,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PeriksaScreen(pasien: pasien),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 65,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: primaryColor,
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pasien.nama!,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      pasien.alamat!,
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                Text(
                  '${pasien.umur!} Tahun',
                  style: primaryTextStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
