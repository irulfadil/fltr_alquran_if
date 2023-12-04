import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;
  final Color? colorText;
  final Color? backgroundColor;
  final Color colorBorder;
  final double? sizeRadius;
  final double? elevation;
  const CustomElevatedButton({
    super.key,
    this.buttonWidth,
    required this.onPressed,
    required this.text,
    this.colorText,
    this.backgroundColor,
    this.sizeRadius,
    this.elevation,
    required this.colorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.0,
      width: MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: elevation,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: colorBorder),
            ),
            textStyle: TextStyle(
              color: colorText,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: colorText,
            ),
          )),
    );
  }
}
