import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:praktik_dokter/theme.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintTxt;
  final String? icon;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;

  const CustomPasswordTextField({
    Key? key,
    this.controller,
    this.hintTxt,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.icon,
  }) : super(key: key);

  @override
  CustomPasswordTextFieldState createState() => CustomPasswordTextFieldState();
}

class CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: primaryTextStyle.copyWith(
              fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: primaryColor.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 1)) // changes position of shadow
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              controller: widget.controller,
              obscureText: _obscureText,
              focusNode: widget.focusNode,
              textInputAction: widget.textInputAction ?? TextInputAction.next,
              onFieldSubmitted: (v) {
                setState(() {
                  widget.textInputAction == TextInputAction.done
                      ? FocusScope.of(context).consumeKeyboardToken()
                      : FocusScope.of(context).requestFocus(widget.nextNode);
                });
              },
              validator: (value) {
                return null;
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon:
                          Icon(_obscureText ? Iconsax.eye_slash : Iconsax.eye),
                      onPressed: _toggle),
                  hintText: widget.hintTxt ?? '',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 15),
                  isDense: true,
                  filled: true,
                  fillColor: whiteColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: SvgPicture.asset(
                    "assets/password-icon.svg",
                    width: 10,
                    height: 10,
                    fit: BoxFit.scaleDown,
                  ),
                  hintStyle: secondaryTextStyle.copyWith(
                      color: Theme.of(context).hintColor),
                  border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}
