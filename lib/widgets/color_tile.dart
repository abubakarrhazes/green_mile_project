import 'package:flutter/material.dart';

class ColorTile extends StatelessWidget {
  const ColorTile({
    required this.icon,
    required this.color,
    required this.text,
    required this.iconColor,
    required this.tap,
  });
  final IconData icon;
  final Color color;
  final Color iconColor;
  final String text;
  final Function() tap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tap,
      leading: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: color.withOpacity(0.09),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      title: Text(
        text,
        style: const TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
      ),
    );
  }
}
