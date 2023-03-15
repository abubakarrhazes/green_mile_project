import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {

  const Avatar({
    Key?key,
     required this.radius,
      this.onTap,
      required this.img,
     }):super(key: key);

  const Avatar.small({
    Key?key,
      this.onTap,
      required this.img,
     }): radius = 18,
     super(key: key);

  const Avatar.medium({
    Key?key,
     this.onTap,
     required this.img
     }): radius = 25,
     super(key: key);

  const Avatar.large({
    Key?key,
      this.onTap,
      required this.img,
     }): radius = 54,
     super(key: key);

     final double radius;
     final VoidCallback? onTap;
     final ImageProvider img;

     
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: CircleAvatar(
      radius:radius,
      backgroundImage: img,
    ),
      );
  }
}