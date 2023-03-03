import 'package:flutter/material.dart';
import 'package:green_mile/screens/onboard_screen/onboard_controller.dart';
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
              onPressed: () => print('Hola'),
              child: const Text(
                'Skip',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        body: PageView.builder(
            itemCount: controller.screens.length,
            itemBuilder: (BuildContext context, index) {
              return Column(children: [
                OnboardContent(
                    image: controller.screens[index].imageAsset,
                    text: controller.screens[index].text,
                    desc: controller.screens[index].desc),
                const SizedBox(
                  height: 10,
                ),
              ]);
            }),
      ),
    );
  }
}
