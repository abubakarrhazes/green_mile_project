import 'package:flutter/material.dart';

class OptionalLogin extends StatelessWidget {
  const OptionalLogin(
      {required this.image, required this.text, required this.loginAction});

  final String image, text;
  final Function() loginAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loginAction,
      child: Container(
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
            Image.network(
              image,
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
