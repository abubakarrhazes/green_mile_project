import 'package:flutter/material.dart';
import 'package:green_mile/screens/pages/profile_page.dart';

import 'chat_page.dart';
import 'history_page.dart';
import 'main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<BottomAppBarNavigationItem> _bottomBarItems;
  int currentIndex = 0;

  @override
  void initState() {
    _bottomBarItems = [
      BottomAppBarNavigationItem('Home', Icons.apps, const MainPage()),
      BottomAppBarNavigationItem('Chat Room', Icons.chat, const ChatPage()),
      BottomAppBarNavigationItem(
          'History', Icons.history_outlined, const HistoryPage()),
      BottomAppBarNavigationItem('Profile', Icons.person, const ProfilePage()),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1601662528567-526cd06f6582?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80')),
          ),
          child: _bottomBarItems[currentIndex].body,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(42)),
            boxShadow: [BoxShadow(offset: Offset(0, -2))]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_bottomBarItems.length, (index) {
              return IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  color: currentIndex == index ? Colors.black : Colors.grey,
                  iconSize: currentIndex == index ? 32 : null,
                  icon: Icon(_bottomBarItems[index].iconData),
                  tooltip: _bottomBarItems[index].label);
            })),
      )),
    );
  }
}

class BottomAppBarNavigationItem {
  final String label;
  final IconData iconData;
  final Widget body;

  BottomAppBarNavigationItem(this.label, this.iconData, this.body);
}
