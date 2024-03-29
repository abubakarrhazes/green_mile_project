import 'package:flutter/material.dart';
import 'package:green_mile/screens/pages/profile_page.dart';

import 'chat_page.dart';
import 'location_page.dart';
import 'main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> pages;

  @override
  void initState() {
    pages = <Widget>[
      const MainPage(),
      const ChatPage(),
      const LocationPage(),
      const ProfilePage(),
    ];
    super.initState();
  }

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1601662528567-526cd06f6582?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80')),
        ),
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.apps), tooltip: 'Home', label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat), tooltip: 'Chatroom', label: 'Chatroom'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                tooltip: 'Location',
                label: 'Location'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), tooltip: 'Profile', label: 'Profile')
          ]),
    );
  }
}
