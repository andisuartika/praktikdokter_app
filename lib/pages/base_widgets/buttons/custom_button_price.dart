// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../theme.dart';

class CustomButtonPrice extends StatelessWidget {
  final Function? onTap;
  final double height;
  final double margin;

  final String label;
  const CustomButtonPrice({
    Key? key,
    this.onTap,
    this.height = 50,
    this.margin = 10,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        height: height,
        width: 100,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: secondaryColor),
        ),
        child: Center(
          child: Text(
            label,
            style: primaryTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
