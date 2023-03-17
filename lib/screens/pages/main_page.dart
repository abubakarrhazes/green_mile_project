import 'package:flutter/material.dart';
import 'package:green_mile/providers/auth_provider.dart';
import 'package:green_mile/widgets/action_button.dart';
import 'package:green_mile/widgets/custom_delegate.dart';
import 'package:green_mile/widgets/profile_photo.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final currentUser = AuthProvider.getCurrentUser()!;
  List imges = [
    'https://thumbs.dreamstime.com/b/man-s-balance-9894256.jpg',
    'https://thumbs.dreamstime.com/b/female-lawyer-office-portrait-boutique-law-firm-signing-documents-54969196.jpg',
    'https://thumbs.dreamstime.com/b/depressed-young-crying-woman-victim-domestic-violence-abuse-domestic-violence-depressed-young-crying-woman-victim-172161533.jpg',
    'https://thumbs.dreamstime.com/b/communication-background-table-top-vintage-old-red-telephone-receiver-business-womans-hand-holding-handset-against-130105092.jpg'
  ];

  List imgs = [
    'https://cdn-icons-png.flaticon.com/512/3321/3321770.png',
    'https://cdn-icons-png.flaticon.com/512/8562/8562995.png',
    'https://cdn-icons-png.flaticon.com/512/5862/5862869.png',
    'https://cdn-icons-png.flaticon.com/512/8972/8972994.png',
  ];

  List jibby = [
    'Solving family dispute',
    'Hire a Lawyer',
    'Report any abuse',
    'Emergency call',
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Container(
            padding: const EdgeInsets.only(
              top: 12,
              left: 20,
            ),
            child: Row(children: <Widget>[
              ProfilePhoto(currentUser.displayName, currentUser.photoURL,
                  radius: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Hi, ${currentUser.displayName!}',
                  style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: ActionsButton(
                  icon: Icons.search,
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                ),
              ),
            ])),
        const SizedBox(height: 20), //40
        Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              'Find Help!',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = const LinearGradient(colors: <Color>[
                      Color.fromARGB(255, 41, 167, 226),
                      Colors.deepPurpleAccent,
                      Colors.indigo,
                    ]).createShader(
                        const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))),
            )),
        const SizedBox(height: 15), //30
        Container(
            child: Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
              labelPadding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: const CircleTabIndicator(
                  color: Color.fromRGBO(41, 30, 83, 1), radius: 4),
              tabs: const [
                Tab(text: 'What we offer'),
                Tab(text: 'Hire a lawyer'),
                Tab(text: 'Donation')
              ]),
        )),
        const SizedBox(height: 10),
        Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(controller: _tabController, children: [
              ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.only(right: 80, top: 15),
                    margin: const EdgeInsets.only(right: 25),
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(imges[
                                index]), //AssetImage('assets/images/'+images.keys.elementAt()),
                            fit: BoxFit.cover,
                            colorFilter: const ColorFilter.mode(
                              Color.fromARGB(126, 255, 255, 255),
                              BlendMode.darken,
                            ))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 5,
                      ),
                      child: Text(
                        jibby[index],
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Lawyers Avaliable',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20), //40
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Image(
                                  image: AssetImage('assets/images/law.png'),
                                  height: 80,
                                  width: 80),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Text('Barrister Esther jones',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text(
                                    'Supreme Court',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                      const SizedBox(height: 20), //40
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Image(
                                  image: AssetImage('assets/images/law1.png'),
                                  height: 80,
                                  width: 80),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Text('Barrister Janet jacob',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text(
                                    'Supreme high court',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                      const SizedBox(height: 20), //40
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Image(
                                  image: AssetImage('assets/images/law 2.png'),
                                  height: 80,
                                  width: 80),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Text('Barrister malcom omon',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text(
                                    'Supreme high court',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      )
                    ],
                  ),
                ),
              ),
              const Text('Donations')
            ])),
        const SizedBox(height: 20), //20
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Explore more',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text('See all', style: TextStyle(color: Colors.grey)),
                ])),
        const SizedBox(height: 11), //20
        Container(
          width: double.maxFinite,
          height: 100,
          margin: const EdgeInsets.only(
            left: 20,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(imgs[
                                  index]), //AssetImage('assets/images/'+images.keys.elementAt()),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ]),
    ));
  }
}

class CircleTabIndicator extends Decoration {
  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });

  final Color color;
  final double radius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  const _CirclePainter({
    required this.color,
    required this.radius,
  });

  final Color color;
  final double radius;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
