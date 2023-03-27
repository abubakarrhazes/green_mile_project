import 'package:flutter/material.dart';

class DateLable extends StatelessWidget {
  const DateLable({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color:const Color.fromARGB(255, 212, 238, 250),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 4.0,
            ),
            child:Text('Today',
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color:Color.fromARGB(255, 5, 133, 193)
              ),
            ),
          ),
        ),
      ),
    );
  }
}