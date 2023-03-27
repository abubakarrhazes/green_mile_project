import 'package:flutter/material.dart';

class GlowingActionButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const GlowingActionButton({
    required this.color,
    required this.icon,
    this.size = 54,
    required this.onpressed,
  });

  final Color color;
  final IconData icon;
  final double size;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 24,
            spreadRadius: 10,
            //offset: const Offset(-22, 0),
          ),
        ]
      ),

      child: ClipOval(
        child: Material(
          color: color,
          child: InkWell(
            splashColor: Colors.grey,
            onTap: onpressed,
            child: SizedBox(
              width: size,
              height: size,
              child: Icon(
                icon,
                size: 26,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),

    );
  }
  
}
