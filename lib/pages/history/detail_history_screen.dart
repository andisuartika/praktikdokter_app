import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:praktik_dokter/data/models/response/history_response_model.dart';
import 'package:praktik_dokter/theme.dart';

class DetailHistoryScreen extends StatelessWidget {
  final History history;
  const DetailHistoryScreen({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Center(child: Text("Detail History")),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Detail Informasi Pasien",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Divider(
                  color: secondaryTextColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Nama :",
                  style: primaryTextStyle.copyWith(fontWeight: FontWeight.w400),
                ),
                Text(
                  history.nama!,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Umur :",
                  style: primaryTextStyle.copyWith(fontWeight: FontWeight.w400),
                ),
                Text(
                  "${history.umur!.toString()} tahun",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Alamat :",
                  style: primaryTextStyle.copyWith(fontWeight: FontWeight.w400),
                ),
                Text(
                  "${history.alamat!.toString()}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: secondaryTextColor,
                ),
                Text(
                  "Detail Riwayat Pemriksaan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(DateFormat('dd MMM yyyy').format(history.tanggal!)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Keluhan :", style: primaryTextStyle),
                    Text(
                      history.keluhan!,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: secondaryTextColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tekanan Darah :", style: primaryTextStyle),
                    Text(
                      history.tekananDarah!,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: secondaryTextColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nadi :", style: primaryTextStyle),
                    Text(
                      history.nadi!,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: secondaryTextColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Respiratory Rate :", style: primaryTextStyle),
                    Text(
                      history.rr!,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: secondaryTextColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Suhu :", style: primaryTextStyle),
                    Text(
                      history.rr!,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: secondaryTextColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pemeriksaan Fisik :", style: primaryTextStyle),
                    Text(
                      history.fisik!,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: secondaryTextColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Diagnosis :", style: primaryTextStyle),
                    Text(
                      history.fisik!,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: secondaryTextColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tata Laksana :", style: primaryTextStyle),
                    Text(
                      history.tataLaksana!,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: secondaryTextColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rujuk :", style: primaryTextStyle),
                    if (history.rujuk == 0)
                      Text(
                        "Tidak",
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    if (history.rujuk == 1)
                      Text(
                        "Ya",
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
                Divider(
                  color: secondaryTextColor,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
