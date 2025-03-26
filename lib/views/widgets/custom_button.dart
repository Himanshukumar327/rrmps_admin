import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? textStyle;
  final ShapeBorder? shape;
  final Color? color;
  final double? height;
  final void Function() onPressed;

  const CustomButton({
    super.key,
    required this.buttonText,
    this.textStyle,
    required this.onPressed,
    this.shape,
    this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      color: color,
      onPressed: onPressed,
      shape: shape,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
