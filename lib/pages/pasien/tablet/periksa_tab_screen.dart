import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:praktik_dokter/pages/base_widgets/buttons/custom_button_price.dart';

import '../../../theme.dart';
import '../../base_widgets/accordion/accordion.dart';
import '../../base_widgets/textfield/custom_textfield_pasien.dart';

class PeriksaTabScreen extends StatefulWidget {
  const PeriksaTabScreen({super.key});

  @override
  State<PeriksaTabScreen> createState() => _PeriksaTabScreenState();
}

class _PeriksaTabScreenState extends State<PeriksaTabScreen> {
  DateTime? selectedDate;
  String? selectedValue;
  int tarif = 0;
  bool isRujuk = false;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _keluhanController = TextEditingController();
  TextEditingController _tekananDarahController = TextEditingController();
  TextEditingController _nadiController = TextEditingController();
  TextEditingController _rrController = TextEditingController();
  TextEditingController _suhuController = TextEditingController();
  TextEditingController _fisikController = TextEditingController();
  TextEditingController _diagnosisController = TextEditingController();
  TextEditingController _tataLaksanaController = TextEditingController();
  TextEditingController _tarifController = TextEditingController();
  TextEditingController _tempatController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _namaController.text = 'Putu Mastika';
    _dateController.text = '28-02-2000';
    _alamatController.text = 'Singaraja';
  }

  void resTarif(int nilai) {
    tarif = tarif + nilai;

    _tarifController.text = tarif.toString();
  }

  List<String> items = <String>['Ya', 'Tidak'];

  @override
  Widget build(BuildContext context) {
    // Scren Width
    final double width = MediaQuery.of(context).size.width;

    Widget pasienForm() {
      return Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: secondaryColor,
          ),
        ),
        child: Column(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFieldPasien(
                  width: width * 0.45,
                  readOnly: true,
                  label: 'Nama',
                  hint: 'masukkan nama',
                  controller: _namaController,
                ),
                CustomTextFieldPasien(
                  width: width * 0.45,
                  readOnly: true,
                  label: 'Tanggal Lahir',
                  hint: 'masukkan tanggal lahir',
                  controller: _dateController,
                  isDate: true,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFieldPasien(
              textInputType: TextInputType.multiline,
              height: 80,
              maxLine: 5,
              readOnly: false,
              label: 'Alamat',
              hint: 'masukkan alamat',
              controller: _alamatController,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }

    Widget periksaForm() {
      return Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 800,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: secondaryColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pemeriksaan',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFieldPasien(
              textInputType: TextInputType.multiline,
              height: 70,
              maxLine: 10,
              label: 'Keluhan',
              hint: 'keluhan',
              controller: _keluhanController,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFieldPasien(
                  width: width * 0.45,
                  label: 'Tekanan Darah',
                  hint: 'tekanan darah',
                  controller: _tekananDarahController,
                ),
                CustomTextFieldPasien(
                  width: width * 0.45,
                  label: 'Nadi',
                  hint: '...../.....',
                  controller: _nadiController,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFieldPasien(
                  width: width * 0.45,
                  label: 'Respiratory Rate',
                  hint: '...../menit',
                  controller: _rrController,
                ),
                CustomTextFieldPasien(
                  width: width * 0.45,
                  label: 'Suhu',
                  hint: '.....℃',
                  controller: _suhuController,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFieldPasien(
              textInputType: TextInputType.multiline,
              height: 70,
              maxLine: 10,
              label: 'Pemeriksaan Fisik',
              hint: 'pemeriksaan fisik',
              controller: _fisikController,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFieldPasien(
                  width: width * 0.45,
                  label: 'Diagnosis',
                  hint: 'diagnosis',
                  controller: _diagnosisController,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFieldPasien(
                  width: width * 0.45,
                  label: 'Tata Laksana',
                  hint: 'tata laksana',
                  controller: _tataLaksanaController,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rujuk',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: secondaryColor,
                    ),
                  ),
                  child: DropdownButtonFormField2(
                    decoration: InputDecoration(
                      errorStyle: TextStyle(height: 0),
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: secondaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: secondaryColor,
                        ),
                      ),
                      enabledBorder: InputBorder.none,
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Rujuk/Tidak',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black38,
                    ),
                    iconSize: 30,
                    buttonHeight: 40,
                    buttonPadding: const EdgeInsets.only(left: 0, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: primaryColor),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item.toString(),
                              child: Text(
                                item.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return '';
                      }
                    },
                    onChanged: (value) {
                      selectedValue = value.toString();
                      if (selectedValue == 'Ya') {
                        setState(() {
                          isRujuk = true;
                        });
                      } else {
                        setState(() {
                          isRujuk = false;
                        });
                      }
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                      if (selectedValue == 'Ya') {
                        setState(() {
                          isRujuk = true;
                        });
                      } else {
                        setState(() {
                          isRujuk = false;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isRujuk,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextFieldPasien(
                      width: width * 0.45,
                      label: 'Tempat',
                      hint: 'dirujuk ke...',
                      controller: _tempatController,
                    ),
                    CustomTextFieldPasien(
                      width: width * 0.45,
                      label: 'Keterangan',
                      hint: 'keterangan',
                      controller: _keteranganController,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFieldPasien(
              label: 'Tarif',
              hint: 'tarif',
              controller: _tarifController,
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomButtonPrice(
                  label: '100.000',
                  onTap: () {
                    resTarif(100000);
                  },
                ),
                CustomButtonPrice(
                  label: '50.000',
                  onTap: () {
                    resTarif(50000);
                  },
                ),
                CustomButtonPrice(
                  label: '25.000',
                  onTap: () {
                    resTarif(25000);
                  },
                ),
                CustomButtonPrice(
                  label: '20.000',
                  onTap: () {
                    resTarif(25000);
                  },
                ),
                CustomButtonPrice(
                  label: '10.000',
                  onTap: () {
                    resTarif(10000);
                  },
                ),
                CustomButtonPrice(
                  label: '5.000',
                  onTap: () {
                    resTarif(5000);
                  },
                ),
                CustomButtonPrice(
                  label: '1.000',
                  onTap: () {
                    resTarif(1000);
                  },
                ),
                Expanded(child: SizedBox()),
                CustomButtonPrice(
                  label: 'Reset',
                  onTap: () {
                    setState(() {
                      _tarifController.text = '0';
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Simpan',
                  style: primaryTextStyle.copyWith(
                    color: whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget riwayatPeriksa() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Riwayat Pemeriksaan Pasien',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                text: 'Input Pemeriksaan',
              ),
              Tab(
                text: 'Riwayat Pemeriksaan',
              ),
            ],
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Iconsax.arrow_left)),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    pasienForm(),
                    SizedBox(
                      height: 20,
                    ),
                    periksaForm(),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    pasienForm(),
                    riwayatPeriksa(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
