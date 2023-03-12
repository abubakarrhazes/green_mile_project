import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showSuccess(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Stack(
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.green, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 48,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ),
                      Text(
                        'Registration Completed Proceed to Login',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/images/check-mark.png',
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
  );
}

void showError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 18),
    ),
    backgroundColor: Colors.red,
  ));
}
