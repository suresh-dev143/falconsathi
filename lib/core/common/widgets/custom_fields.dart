import 'package:flutter/material.dart';

class CustomFields extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool readonly;
  final bool isObscureText;
  final VoidCallback? onTap;
  final Color? fillColor;
  final Icon? icon;
  final Icon? iconSuffix;
  final TextInputType textinputtype;

  const CustomFields(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.textinputtype,
      this.readonly = false,
      this.isObscureText = false,
      this.onTap,
      this.fillColor,
      this.icon,
      this.iconSuffix});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      keyboardType: textinputtype,
      readOnly: readonly,
      obscureText: isObscureText,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        prefixIcon: icon,
        suffixIcon: iconSuffix,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
      ),
    );
  }
}
