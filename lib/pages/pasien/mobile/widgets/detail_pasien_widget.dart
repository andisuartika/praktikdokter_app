// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:praktik_dokter/data/models/response/pasien_response_model.dart';

import '../../../../theme.dart';
import '../../../base_widgets/textfield/custom_textfield_pasien.dart';

class DetailPasienWidget extends StatefulWidget {
  final Pasien pasien;
  const DetailPasienWidget({
    Key? key,
    required this.pasien,
  }) : super(key: key);

  @override
  State<DetailPasienWidget> createState() => _DetailPasienWidgetState();
}

class _DetailPasienWidgetState extends State<DetailPasienWidget> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _umurController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _namaController.text = widget.pasien.nama.toString();
    _umurController.text = widget.pasien.umur.toString();
    _alamatController.text = widget.pasien.alamat.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Data Pasien',
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextFieldPasien(
          readOnly: true,
          label: 'Nama',
          hint: 'masukkan nama',
          controller: _namaController,
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextFieldPasien(
          readOnly: true,
          label: 'Umur',
          hint: 'masukkan tanggal lahir',
          controller: _umurController,
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextFieldPasien(
          readOnly: true,
          label: 'Alamat',
          hint: 'masukkan alamat',
          controller: _alamatController,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
