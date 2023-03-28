import 'package:flutter/material.dart';
import 'package:green_mile/widgets/profile_photo.dart';

import '../providers/auth_provider.dart';

class UserTile extends StatelessWidget {
  UserTile({Key? key}) : super(key: key);
  final currentUser = AuthProvider.getUser()!;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfilePhoto(currentUser.displayName, currentUser.photoURL,
          radius: 20),
      title: Text(
        '${currentUser.displayName}',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          foreground: Paint()
            ..shader = const LinearGradient(colors: <Color>[
              Color.fromARGB(255, 41, 167, 226),
              Colors.deepPurpleAccent,
              Colors.indigo,
            ]).createShader(
              const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
            ),
        ),
      ),
      subtitle: Text(
        '${currentUser.email}',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          foreground: Paint()
            ..shader = const LinearGradient(colors: <Color>[
              Color.fromARGB(255, 41, 167, 226),
              Colors.deepPurpleAccent,
              Colors.indigo,
            ]).createShader(
              const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
            ),
        ),
      ),
    );
  }
}
