import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionalLogin extends StatelessWidget {
  const OptionalLogin(
      {required this.image, required this.text, required this.onPress});

  final String image, text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
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
            Image.asset(
              image,
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
