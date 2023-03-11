import 'package:flutter/material.dart';
import 'package:green_mile/screens/onboard_screen/onboard_controller.dart';
import 'package:green_mile/widgets/button_widget.dart';
import 'package:green_mile/widgets/onboard_content.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

final controller = OnboardController();

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Text(
                'Skip',
                style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        body: PageView.builder(
          itemCount: controller.screens.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OnboardContent(
                      image: controller.screens[index].imageAsset,
                      text: controller.screens[index].text,
                      desc: controller.screens[index].desc),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.screens.length,
                      (index) => Container(
                        margin: const EdgeInsets.all(5),
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  ButtonWidget(
                    text: 'Continue Here',
                    onPress: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
