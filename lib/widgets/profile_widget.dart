import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String text;
  final IconData icons;
  final Function() onPressed;

  ProfileWidget(
      {super.key,
      required this.text,
      required this.icons,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              icons,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
