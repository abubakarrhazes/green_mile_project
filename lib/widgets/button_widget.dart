import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function() onPress;
  ButtonWidget({required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
