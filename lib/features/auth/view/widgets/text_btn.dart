import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final VoidCallback? onTap;
  final TextDecoration textDecoration;
  final Color? decorationColor;
  const TextBtn(
      {super.key,
      required this.btnText,
      required this.btnColor,
      required this.onTap,
      required this.textDecoration,
      this.decorationColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 15,
            color: btnColor,
            decoration: textDecoration,
            decorationColor: decorationColor,
          ),
        ));
  }
}
