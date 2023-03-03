import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final String? image;

  ButtonWidget({required this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            children: [
              Image.asset(image!),
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
