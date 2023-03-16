import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  final String? name;
  final String? photoUrl;
  final double? radius;

  /// The text backgroundColor. photo backgroundColor is lightgrey
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? textStyle;
  final void Function()? onTap;

  const ProfilePhoto(this.name, this.photoUrl,
      {super.key,
      this.radius,
      this.backgroundColor,
      this.foregroundColor,
      this.textStyle,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: photoUrl == null ? backgroundColor : Color(0xFFC8C8C8),
        foregroundColor: foregroundColor,
        backgroundImage: photoUrl != null ? NetworkImage(photoUrl!) : null,
        child: photoUrl == null
            ? Text(name?[0].toUpperCase() ?? '?', style: textStyle)
            : null,
      ),
    );
  }
}
