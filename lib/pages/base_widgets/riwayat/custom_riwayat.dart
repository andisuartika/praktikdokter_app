// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:praktik_dokter/data/models/response/history_response_model.dart';
import 'package:praktik_dokter/pages/history/detail_history_screen.dart';

import '../../../theme.dart';

class CustomRiwayat extends StatelessWidget {
  final History history;

  const CustomRiwayat({
    Key? key,
    required this.history,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailHistoryScreen(
              history: history,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: secondaryColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              history.nama ?? '',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "${history.umur.toString()} Tahun" ?? '',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                color: primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              child: Text(
                history.alamat ?? '',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  history.keluhan ?? '',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  DateFormat('dd MMM yyyy')
                      .format(history.tanggal ?? DateTime.now()),
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
