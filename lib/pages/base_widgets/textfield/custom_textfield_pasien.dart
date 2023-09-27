// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../theme.dart';

class CustomTextFieldPasien extends StatelessWidget {
  final double width;
  final double height;
  final int? maxLines;
  final TextInputType? textInputType;
  final String label;
  final String hint;
  final bool readOnly;
  final bool? isDate;
  final Function? onTap;
  final validator;
  final TextEditingController? controller;
  final int? maxLine;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  const CustomTextFieldPasien({
    Key? key,
    this.width = double.infinity,
    this.height = 40,
    this.maxLines,
    this.textInputType = TextInputType.text,
    required this.label,
    required this.hint,
    this.readOnly = false,
    this.isDate = false,
    this.onTap,
    this.controller,
    this.maxLine = null,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: primaryTextStyle.copyWith(
            fontSize: 12,
          ),
        ),
        Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: secondaryColor,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: primaryTextStyle.copyWith(fontSize: 12),
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(nextNode);
                  },
                  controller: controller,
                  maxLines: maxLine,
                  onTap: onTap as void Function()?,
                  readOnly: readOnly,
                  focusNode: focusNode,
                  keyboardType: textInputType,
                  decoration: InputDecoration.collapsed(
                    hintText: hint,
                    hintStyle: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                ),
              ),
              isDate! ? Icon(Iconsax.calendar_add) : SizedBox()
            ],
          ),
        ),
      ],
    );
  }
}
