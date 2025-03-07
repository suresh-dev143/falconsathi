import 'package:flutter/material.dart';
import 'package:falconsathi/core/theme/app_pallete.dart';

class GradiantButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final double? buttonWidth;
  const GradiantButton(
      {super.key,
      required this.buttonText,
      this.buttonWidth,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: buttonWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Pallete.gradient1, Pallete.gradient2],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent),
          child: Text(buttonText,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              )),
        ));
  }
}
