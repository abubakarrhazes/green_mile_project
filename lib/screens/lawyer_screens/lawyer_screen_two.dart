
import 'package:flutter/material.dart';
import 'package:green_mile/widgets/responsive-button.dart';
import 'package:green_mile/widgets/reusable_button.dart';

class LawyerScreenTwo extends StatelessWidget {
   LawyerScreenTwo({super.key});

  int gottenStars = 5;

  List shapeText= [
    '25%',
    '50%',
    '75%',
    '100',
  ];

  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
              Positioned(
                left:0,
                right: 0,
                child: Container(
                  width:double.maxFinite,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/law1.png'),
                      fit: BoxFit.cover
                      )
                  ),
                )
                ),
                 Positioned(
              left:5,
              top:50,
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                     icon: const Icon(Icons.arrow_back),
                     color: Colors.white,
                     )
                ],
              )
              ),
              Positioned(
                top:320,
                child: Container(
                  padding: const EdgeInsets.only(
                    right:20,
                    left: 20,
                    top:30
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 800,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(35),
                      topRight:Radius.circular(35),
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Janet jacob',
                                style: TextStyle(
                                fontSize: 30,
                                 fontWeight: FontWeight.bold,
                                 foreground: Paint()..shader = const LinearGradient(
                                  colors:<Color>[
                                    Color.fromARGB(255, 41, 167, 226),
                                    Colors.deepPurpleAccent,
                                    Colors.indigo,
                                       ]
                                       ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0)) 
                               ),
                               ),
                                const SizedBox(height: 2),
                               Text('Barrister (Federal high court)',
                                style: TextStyle(
                                fontSize: 15,
                                 fontWeight: FontWeight.bold,
                                 foreground: Paint()..shader = const LinearGradient(
                                  colors:<Color>[
                                    Color.fromARGB(255, 41, 167, 226),
                                    Colors.deepPurpleAccent,
                                    Colors.indigo,
                                       ]
                                       ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0)) 
                               ),
                               ),
                             ],
                           ),
                            const Text('\$FREE',
                                style: TextStyle(
                                fontSize: 30,
                                 fontWeight: FontWeight.bold,
                                 color:Colors.black
                               ),
                               ),
                         ],
                       ),
                         const SizedBox(height: 10),
                         Row(
                          children:const <Widget>[
                            Icon(Icons.location_on,
                            color:Colors.black
                            ),
                             SizedBox(width: 5),
                            Text('SA,Johannesburg',
                                style: TextStyle(
                                fontSize: 18,
                                 fontWeight: FontWeight.bold,
                                 color:Colors.black
                               ),
                               )
                          ]
                         ),
                         const  SizedBox(height:5),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index){ // you can use flutter rating indicator
                                  return Icon(Icons.star,
                                  color:index < gottenStars ? Colors.yellowAccent : Colors.grey,
                                  );
                                })
                              ),
                          const SizedBox(width:10),
                          const Text('(5.0)',
                                style: TextStyle(
                                fontSize: 20,
                                 fontWeight: FontWeight.bold,
                                 color:Colors.grey
                               ),
                               ),
                            ],
                          ),
                          const  SizedBox(height:10),
                           Text('Cases',
                          style: TextStyle(
                            color:Colors.black.withOpacity(0.8),
                            fontSize: 20,
                          ),
                          ),
                          const  SizedBox(height:5),
                          const Text('Number of cases won',
                          style: TextStyle(
                            color:Colors.grey,
                            fontSize: 15,
                          ),
                          ),
                          const  SizedBox(height:10),
                           Wrap(
                                children: List.generate(5, (index){
                                  return Container(
                                    margin: const EdgeInsets.only(
                                      right: 10
                                    ),
                                    child: ReuseableButton(
                                      color: index == selectedIndex ?Colors.white:Colors.indigo,
                                      borderColor:index == selectedIndex ? Colors.indigo : const Color.fromARGB(255, 212, 238, 250),
                                      backgroundColor: index == selectedIndex ? Colors.indigo : const Color.fromARGB(255, 212, 238, 250),
                                      size: 50,
                                      text: (index+90).toString(),
                                    ),
                                  );
                                })
                              ),
                               const  SizedBox(height:10),
                               Text('Description',
                                 style: TextStyle(
                                 color:Colors.black.withOpacity(0.8),
                                  fontSize: 20,
                               ),
                             ),
                              const  SizedBox(height:5),
                              const Text(
                              'Barrister Janet jacob in known for her competence in bringing and implementing justice where duly served and she is proven to help you win to win any court case that is impossible to win',
                              style:TextStyle(
                                color:Colors.grey,
                                fontSize: 13,
                              )
                              )
                    ],
                  ),
                )
                ),

                Positioned(
                  bottom:10,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: <Widget>[
                      ReuseableButton(
                        color: Colors.indigo,
                        backgroundColor: Colors.transparent,
                        size: 50,
                        borderColor: Colors.indigo,
                        isIcon: true,
                        icon: Icons.favorite_border,
                         ),
                          const  SizedBox(width:20),
                         ResponsiveButton(
                          isResponsive: true,
                         )
                    ],
                  )
                  )
          ],
        ),
      )
    );
  }
}