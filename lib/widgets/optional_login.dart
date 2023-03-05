import 'package:flutter/material.dart';

class OptionalLogin extends StatelessWidget {
  const OptionalLogin({required this.image, required this.text});

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 450,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.deepPurpleAccent,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 25,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
