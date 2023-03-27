import 'package:flutter/material.dart';

class ReuseableButton extends StatelessWidget {
  ReuseableButton({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.text,
    this.icon,
    this.isIcon = false,
  });

  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon == false
          ? Center(
              child: Text(text!,
               style:  TextStyle(
                color: color
                )))
          : Center(
              child: Icon(
              icon,
              color: color,
            )),
    );
  }
}
