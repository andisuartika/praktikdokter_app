import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:praktik_dokter/bloc/pasien/pasien_bloc.dart';
import 'package:praktik_dokter/data/models/request/pasien_request_model.dart';
import 'package:praktik_dokter/pages/base_widgets/textfield/custom_textfield_pasien.dart';
import 'package:praktik_dokter/pages/pasien/periksa_screen.dart';
import 'package:praktik_dokter/theme.dart';

class PasienScreen extends StatefulWidget {
  const PasienScreen({super.key});

  @override
  State<PasienScreen> createState() => _PasienScreenState();
}

class _PasienScreenState extends State<PasienScreen> {
  DateTime? selectedDate;
  String? selectedJK;
  PasienRequestModel? pasienModel;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> items = <String>['Laki-laki', 'Perempuan'];

  void storePasien() async {
    _formKey!.currentState!.save();
    String nama = _namaController!.text.trim();
    String tglLahir = _dateController!.text.trim();
    String alamat = _alamatController!.text.trim();
    String jenisKelamin = selectedJK.toString();

    if (nama.isEmpty ||
        tglLahir.isEmpty ||
        tglLahir.isEmpty ||
        jenisKelamin.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('silahkan lengkapi data pasien'),
        backgroundColor: Colors.red,
      ));
    } else {
      final model = PasienRequestModel(
        nama: nama,
        tglLahir: tglLahir,
        alamat: alamat,
        jenisKelamin: jenisKelamin,
      );
      setState(() {
        pasienModel = model;
      });
      context.read<PasienBloc>().add(PasienEvent.pasien(model));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Search
    Widget search() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 290,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFECF0F6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: primaryTextStyle,
                          // controller: searchController,
                          onTap: () {},
                          // controller: searchController,
                          // onChanged: searching,
                          decoration: InputDecoration.collapsed(
                            hintText: 'search pasien',
                            hintStyle: secondaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: regular,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(
                        Iconsax.search_normal_1,
                        size: 20,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Iconsax.add,
                      color: whiteColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget pasienForm() {
      return Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 420,
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFieldPasien(
                    readOnly: false,
                    label: 'Nama',
                    hint: 'masukkan nama',
                    controller: _namaController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldPasien(
                    readOnly: true,
                    label: 'Tanggal Lahir',
                    hint: 'masukkan tanggal lahir',
                    controller: _dateController,
                    isDate: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);
                        setState(() {
                          _dateController.text = formattedDate;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jenis Kelamin',
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
                            'pilih jenis kelamin',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black38,
                          ),
                          iconSize: 30,
                          buttonHeight: 40,
                          buttonPadding:
                              const EdgeInsets.only(left: 0, right: 10),
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
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            selectedJK = value.toString();
                          },
                          onSaved: (value) {
                            selectedJK = value.toString();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldPasien(
                    readOnly: false,
                    label: 'Alamat',
                    hint: 'masukkan alamat',
                    controller: _alamatController,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BlocListener<PasienBloc, PasienState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (message) {
                    return ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                  },
                  loaded: (data) async {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('data pasien berhasil disimpan'),
                      backgroundColor: Colors.green,
                    ));
                    // Push to Periksa
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return PeriksaScreen(
                        pasien: data.data!.first,
                      );
                    }), (route) => false);
                  },
                );
              },
              child: BlocBuilder<PasienBloc, PasienState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return GestureDetector(
                        onTap: () {
                          if (_formKey!.currentState!.validate()) {
                            storePasien();
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                              child: Text(
                            'Simpan',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                        ),
                      );
                    },
                    loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Tambah Data Pasien',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 22, vertical: 30),
            child: Column(
              children: [
                // search(),
                pasienForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
