// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:praktik_dokter/data/models/response/history_response_model.dart';
import 'package:praktik_dokter/theme.dart';

class Accordion extends StatefulWidget {
  final History model;

  const Accordion({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  // Show or hide the content
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title:
                Text(DateFormat('EEEE, d MMM y').format(widget.model.tanggal!)),
            trailing: IconButton(
              icon: Icon(
                  _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              onPressed: () {
                setState(() {
                  _showContent = !_showContent;
                });
              },
            ),
          ),
          // Show or hide the content based on the state
          _showContent
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Keluhan : ${widget.model.keluhan.toString()}',
                        style: secondaryTextStyle,
                      ),
                      Text(
                        'Tekanan Darah : ${widget.model.tekananDarah.toString()} mmHg',
                        style: secondaryTextStyle,
                      ),
                      Text(
                        'Nadi :  ${widget.model.nadi.toString()}/menit',
                        style: secondaryTextStyle,
                      ),
                      Text(
                        'Respiratory Rate : ${widget.model.rr.toString()}/menit',
                        style: secondaryTextStyle,
                      ),
                      Text(
                        'Suhu : ${widget.model.suhu.toString()} ℃',
                        style: secondaryTextStyle,
                      ),
                      Text(
                        'Pemeriksaan Fisik : ${widget.model.fisik.toString()}',
                        style: secondaryTextStyle,
                      ),
                      Text(
                        'Diagnosis : ${widget.model.diagnosis.toString()}',
                        style: secondaryTextStyle,
                      ),
                      Text(
                        'Tata Laksana : ${widget.model.tataLaksana.toString()}',
                        style: secondaryTextStyle,
                      ),
                      Text(
                        'Rujuk : ${widget.model.rujuk.toString()}',
                        style: secondaryTextStyle,
                      ),
                      Text(
                        'Tarif : ${widget.model.tarif.toString()}',
                        style: secondaryTextStyle,
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
