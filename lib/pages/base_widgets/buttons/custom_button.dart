import 'package:flutter/material.dart';

import '../../../theme.dart';

class CustomButton extends StatelessWidget {
  final Function? onTap;
  final String? buttonText;
  final bool isValid;
  final bool isBorder;
  final Color? backgroundColor;
  final double? radius;
  const CustomButton(
      {Key? key,
      this.onTap,
      required this.buttonText,
      this.isValid = false,
      this.isBorder = false,
      this.backgroundColor,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap as void Function()?,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isValid ? primaryColor : secondaryTextColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
            child: Text(
          'Sign In',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}
