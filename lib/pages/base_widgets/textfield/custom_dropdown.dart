// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/material.dart';

import '../../../theme.dart';

class CustomDropdown extends StatefulWidget {
  List<String> items = <String>['Ya', 'Tidak'];
  String label;
  String? selected;
  CustomDropdown({
    Key? key,
    required this.label,
    required this.selected,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: primaryTextStyle.copyWith(
            fontSize: 12,
          ),
        ),
        Container(
          width: double.infinity,
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: secondaryColor,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                children: const [
                  Icon(
                    Icons.list,
                    size: 16,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: widget.items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: widget.selected,
              onChanged: (value) {
                setState(() {
                  widget.selected = value as String;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
