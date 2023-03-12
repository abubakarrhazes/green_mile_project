import 'package:flutter/material.dart';
import 'package:green_mile/screens/onboard_screen/onboard_controller.dart';
import 'package:green_mile/widgets/button_widget.dart';
import 'package:green_mile/widgets/onboard_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

final controller = OnboardController();
int currentPageIndex = 0;
final pageController = PageController(initialPage: currentPageIndex);

@override
void dispose() {
  pageController.dispose();
}

_storeOnboardInfo() async {
  int isViewed = 0;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setInt('onboard', isViewed);
}

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
              onPressed: () async {
                await _storeOnboardInfo();
                Navigator.pushNamed(context, '/login');
              },
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
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                itemCount: controller.screens.length,
                controller: pageController,
                onPageChanged: (int value) {
                  setState(() {
                    currentPageIndex = value;
                  });
                },
                itemBuilder: (_, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: OnboardContent(
                              image: controller.screens[index].imageAsset,
                              text: controller.screens[index].text,
                              desc: controller.screens[index].desc),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.screens.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonWidget(
                      text: 'Next ',
                      onPress: () async {
                        if (currentPageIndex == 2) {
                          await _storeOnboardInfo();
                          Navigator.pushNamed(context, '/login');
                        }
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceIn);
                      },
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(milliseconds: 150),
      height: 6,
      width: currentPageIndex == index ? 20 : 6,
      decoration: BoxDecoration(
          color:
              currentPageIndex == index ? Colors.deepPurpleAccent : Colors.grey,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
