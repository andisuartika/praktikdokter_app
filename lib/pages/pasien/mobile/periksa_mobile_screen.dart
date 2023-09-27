// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';

import 'package:praktik_dokter/bloc/history/history_bloc.dart';
import 'package:praktik_dokter/bloc/pasien/pasien_bloc.dart';
import 'package:praktik_dokter/data/models/request/periksa_request_model.dart';
import 'package:praktik_dokter/data/models/response/pasien_response_model.dart';
import 'package:praktik_dokter/pages/base_widgets/buttons/custom_button_price.dart';
import 'package:praktik_dokter/pages/main/main_screen.dart';
import 'package:praktik_dokter/pages/pasien/mobile/widgets/detail_pasien_widget.dart';

import '../../../bloc/periksa/periksa_bloc.dart';
import '../../../data/models/request/pasien_request_model.dart';
import '../../../theme.dart';
import '../../base_widgets/accordion/accordion.dart';
import '../../base_widgets/textfield/custom_textfield_pasien.dart';

class PeriksaMobileScreen extends StatefulWidget {
  final Pasien pasien;
  const PeriksaMobileScreen({
    Key? key,
    required this.pasien,
  }) : super(key: key);

  @override
  State<PeriksaMobileScreen> createState() => _PeriksaMobileScreenState();
}

class _PeriksaMobileScreenState extends State<PeriksaMobileScreen> {
  String? selectedValue;
  int tarif = 0;
  bool isRujuk = false;
  int rujuk = 0;
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    print('refresh');
    context.read<HistoryBloc>().add(HistoryEvent.getHistory(widget.pasien.id!));
  }

  void resTarif(int nilai) {
    tarif = tarif + nilai;
    _tarifController.text = tarif.toString();
  }

  void storePeriksa() async {
    _formKey!.currentState!.save();
    String keluhan = _keluhanController!.text.trim();
    String tekananDarah = _tekananDarahController!.text.trim();
    String nadi = _nadiController!.text.trim();
    String rr = _rrController!.text.trim();
    String fisik = _fisikController!.text.trim();
    String suhu = _suhuController!.text.trim();
    String diagnosis = _diagnosisController!.text.trim();
    String tataLaksana = _tataLaksanaController!.text.trim();
    int tarif = int.tryParse(_tarifController.text) ?? 0;
    String tempat = _tempatController!.text.trim();
    String keterangan = _keteranganController!.text.trim();

    if (keluhan.isEmpty ||
        tekananDarah.isEmpty ||
        nadi.isEmpty ||
        suhu.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('silahkan lengkapi data pemeriksaan'),
        backgroundColor: Colors.red,
      ));
    } else {
      final model = PeriksaRequestModel(
        pasienId: widget.pasien.id!,
        keluhan: keluhan,
        tekananDarah: tekananDarah,
        nadi: nadi,
        rr: rr,
        suhu: suhu,
        fisik: fisik,
        diagnosis: diagnosis,
        tataLaksana: tataLaksana,
        rujuk: rujuk,
        tempat: tempat,
        keterangan: keterangan,
        tarif: tarif,
      );

      context.read<PeriksaBloc>().add(PeriksaEvent.periksa(model));
    }
  }

  List<String> items = <String>['Ya', 'Tidak'];

  @override
  Widget build(BuildContext context) {
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
        child: DetailPasienWidget(pasien: widget.pasien),
      );
    }

    Widget periksaForm() {
      return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: isRujuk ? 1150 : 1000,
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
                height: 60,
                maxLine: 5,
                textInputType: TextInputType.multiline,
                label: 'Keluhan',
                hint: 'keluhan',
                controller: _keluhanController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldPasien(
                label: 'Tekanan Darah',
                hint: 'tekanan darah',
                controller: _tekananDarahController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldPasien(
                label: 'Nadi',
                hint: '...../.....',
                controller: _nadiController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldPasien(
                label: 'Respiratory Rate',
                hint: '...../menit',
                controller: _rrController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldPasien(
                label: 'Suhu',
                hint: '.....℃',
                controller: _suhuController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldPasien(
                height: 60,
                maxLine: 5,
                textInputType: TextInputType.multiline,
                label: 'Pemeriksaan Fisik',
                hint: 'pemeriksaan fisik',
                controller: _fisikController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldPasien(
                label: 'Diagnosis',
                hint: 'diagnosis',
                controller: _diagnosisController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFieldPasien(
                label: 'Tata Laksana',
                hint: 'tata laksana',
                controller: _tataLaksanaController,
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
                            rujuk = 1;
                          });
                        } else {
                          setState(() {
                            isRujuk = false;
                            rujuk = 0;
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFieldPasien(
                        label: 'Tempat',
                        hint: 'dirujuk ke...',
                        controller: _tempatController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFieldPasien(
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
                textInputType: TextInputType.number,
                controller: _tarifController,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtonPrice(
                        label: '100.000',
                        height: 40,
                        margin: 0,
                        onTap: () {
                          resTarif(100000);
                        },
                      ),
                      CustomButtonPrice(
                        label: '50.000',
                        height: 40,
                        margin: 0,
                        onTap: () {
                          resTarif(50000);
                        },
                      ),
                      CustomButtonPrice(
                        label: '25.000',
                        height: 40,
                        margin: 0,
                        onTap: () {
                          resTarif(25000);
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButtonPrice(
                          label: '20.000',
                          height: 40,
                          margin: 0,
                          onTap: () {
                            resTarif(20000);
                          },
                        ),
                        CustomButtonPrice(
                          label: '10.000',
                          height: 40,
                          margin: 0,
                          onTap: () {
                            resTarif(10000);
                          },
                        ),
                        CustomButtonPrice(
                          label: '5.000',
                          height: 40,
                          margin: 0,
                          onTap: () {
                            resTarif(5000);
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtonPrice(
                        label: '1.000',
                        height: 40,
                        margin: 0,
                        onTap: () {
                          resTarif(1000);
                        },
                      ),
                      CustomButtonPrice(
                        label: 'Reset',
                        height: 40,
                        margin: 0,
                        onTap: () {
                          setState(() {
                            tarif = 0;
                            _tarifController.text = '0';
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BlocListener<PeriksaBloc, PeriksaState>(
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Data Berhasil disimpan!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                  );
                },
                child: BlocBuilder<PeriksaBloc, PeriksaState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return GestureDetector(
                          onTap: () {
                            if (_formKey!.currentState!.validate()) {
                              storePeriksa();
                            }
                          },
                          child: Container(
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
                          ),
                        );
                        ;
                      },
                      loading: () => Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget riwayatPeriksa() {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
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
              BlocBuilder<HistoryBloc, HistoryState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        enabled: true,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(bottom: 10),
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: primaryColor,
                          ),
                        ),
                      );
                    },
                    error: (message) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        enabled: true,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(bottom: 10),
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: secondaryColor,
                          ),
                        ),
                      );
                    },
                    loaded: (model) {
                      return Column(
                        children: model.data!
                            .map((model) => Accordion(model: model))
                            .toList(),
                      );
                    },
                  );
                },
              )
            ],
          ),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => MainScreen())));
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
