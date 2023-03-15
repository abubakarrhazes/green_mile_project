import 'package:flutter/material.dart';

class ActionsButton extends StatelessWidget {
// ignore: use_key_in_widget_constructors
const ActionsButton({
  required this.icon,
  required this.onTap,
});


final IconData icon;
final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurpleAccent,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
         borderRadius: BorderRadius.circular(6),
         splashColor:  const Color.fromRGBO(41, 30, 83, 1),
         onTap: onTap,
         child: Padding(
           padding: const EdgeInsets.all(6.0),
           child: Icon(
            icon,
            size: 30,
            color:  Colors.white,

           ),
         ),

      )
    );
    
  }
}