import 'package:flutter/material.dart';
import 'package:green_mile/widgets/color_tile.dart';
import 'package:green_mile/widgets/user_tile.dart';

import '../../providers/auth_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = AuthProvider.getUser()!;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(12),
          physics: const BouncingScrollPhysics(),
          children: [
            UserTile(),
            const Divider(
              color: Colors.deepPurple,
              height: 10,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ColorTile(
                    text: 'Personal Data',
                    icon: Icons.person,
                    color: Colors.deepPurple,
                    iconColor: Colors.deepPurple,
                    tap: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ColorTile(
                    text: 'Settings',
                    icon: Icons.settings,
                    color: Colors.blue,
                    iconColor: Colors.blue,
                    tap: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ColorTile(
                    text: 'Notifications',
                    icon: Icons.notifications,
                    color: Colors.redAccent,
                    iconColor: Colors.redAccent,
                    tap: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ColorTile(
                    text: 'Security',
                    icon: Icons.lock_outline,
                    color: Colors.deepPurple,
                    iconColor: Colors.redAccent,
                    tap: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ColorTile(
                    text: 'Payment',
                    icon: Icons.payment_outlined,
                    color: Colors.deepPurple,
                    iconColor: Colors.redAccent,
                    tap: () {},
                  ),
                  Divider(
                    color: Colors.deepPurple,
                    height: 10,
                  ),
                  ColorTile(
                    text: 'FAQs',
                    icon: Icons.help_outline,
                    color: Colors.deepPurple,
                    iconColor: Colors.grey,
                    tap: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ColorTile(
                    text: 'History',
                    icon: Icons.history_outlined,
                    color: Colors.deepPurple,
                    iconColor: Colors.grey,
                    tap: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ColorTile(
                    text: 'Log Out',
                    icon: Icons.logout,
                    color: Colors.deepPurple,
                    iconColor: Colors.redAccent,
                    tap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
