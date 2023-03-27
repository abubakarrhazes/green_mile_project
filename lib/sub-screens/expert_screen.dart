import 'package:flutter/material.dart';
import 'package:green_mile/widgets/action_button.dart';

class ExpertScreen extends StatelessWidget {
  const ExpertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle:false,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(
            left:20
          ),
          child:IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:const Icon(Icons.arrow_back,
              color:Colors.deepPurpleAccent,
              size: 25,
            )
           
            )
        ),
          title: const Text('Talk to Experts',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17
        ),
        ),       
      ),

      body:Expanded(
        child: Column(
          children:<Widget>[
           const SizedBox(height:20),
            ListView(
              padding: const EdgeInsets.only(
                left: 20,
  right: 20
              ),
               scrollDirection: Axis.vertical,
               shrinkWrap: true,
               children: [
                ListTile(
                   onTap:(){},
                       trailing: Container(
                        decoration:  const BoxDecoration(
                         color:Color.fromARGB(255, 212, 238, 250),
                        ),
                         child: const Padding(
                           padding:  EdgeInsets.all(8.0),
                           child: Icon(Icons.chat_rounded,
                           color:  Colors.deepPurpleAccent,
                           ),
                         ),
                       ),
                        leading: Image.asset('assets/images/doc1.jpg',
                             height:80,
                             width:80
                             ),
                             title: const Padding(
                                  padding: EdgeInsets.symmetric(
                               vertical:5
                             ),
                               child:Text('Gabriel suleman',
                               style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold,
                               ),
                               ),
                             ),
                             subtitle: const Text('Medical Doctor',
                               style: TextStyle(
                               fontSize: 13,
                               fontWeight: FontWeight.bold,
                               color: Colors.grey
                             ),
                             ),
                           ),
                            const SizedBox(height:10.0),
                ListTile(
                   onTap:(){},
                       trailing: Container(
                        decoration:  const BoxDecoration(
                         color:Color.fromARGB(255, 212, 238, 250),
                        ),
                         child: const Padding(
                           padding:  EdgeInsets.all(8.0),
                           child: Icon(Icons.chat_rounded,
                           color:  Colors.deepPurpleAccent,
                           ),
                         ),
                       ),
                        leading: Image.asset('assets/images/expert1.jpg',
                             height:80,
                             width:80
                             ),
                             title: const Padding(
                                  padding: EdgeInsets.symmetric(
                               vertical:5
                             ),
                               child:Text('Maryanne Gabriella',
                               style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold,
                               ),
                               ),
                             ),
                             subtitle: const Text('Counsellor',
                               style: TextStyle(
                               fontSize: 13,
                               fontWeight: FontWeight.bold,
                               color: Colors.grey
                             ),
                             ),
                           ),
                               const SizedBox(height:10.0),
                ListTile(
                   onTap:(){},
                       trailing: Container(
                        decoration:  const BoxDecoration(
                         color:Color.fromARGB(255, 212, 238, 250),
                        ),
                         child: const Padding(
                           padding:  EdgeInsets.all(8.0),
                           child: Icon(Icons.chat_rounded,
                           color:  Colors.deepPurpleAccent,
                           ),
                         ),
                       ),
                        leading: Image.asset('assets/images/expert2.jpg',
                             height:80,
                             width:80
                             ),
                             title: const Padding(
                                  padding: EdgeInsets.symmetric(
                               vertical:5
                             ),
                               child:Text('Solomon Jacobs',
                               style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold,
                               ),
                               ),
                             ),
                             subtitle: const Text('Human Right Activist\'s',
                               style: TextStyle(
                               fontSize: 13,
                               fontWeight: FontWeight.bold,
                                 color: Colors.grey
                             ),
                             ),
                           ),
                               const SizedBox(height:10.0),
                ListTile(
                   onTap:(){},
                       trailing: Container(
                        decoration:  const BoxDecoration(
                         color:Color.fromARGB(255, 212, 238, 250),
                        ),
                         child: const Padding(
                           padding:  EdgeInsets.all(8.0),
                           child: Icon(Icons.chat_rounded,
                           color:  Colors.deepPurpleAccent,
                           ),
                         ),
                       ),
                        leading: Image.asset('assets/images/law.png',
                             height:80,
                             width:80
                             ),
                             title: const Padding(
                                  padding: EdgeInsets.symmetric(
                               vertical:5
                             ),
                               child:Text('Esther Jones',
                               style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold,
                               ),
                               ),
                             ),
                             subtitle: const Text('Barrister',
                               style: TextStyle(
                               fontSize: 13,
                               fontWeight: FontWeight.bold,
                               color: Colors.grey
                             ),
                             ),
                           ),
                             const SizedBox(height:10.0),
                ListTile(
                   onTap:(){},
                       trailing: Container(
                        decoration:  const BoxDecoration(
                         color:Color.fromARGB(255, 212, 238, 250),
                        ),
                         child: const Padding(
                           padding:  EdgeInsets.all(8.0),
                           child: Icon(Icons.chat_rounded,
                           color:  Colors.deepPurpleAccent,
                           ),
                         ),
                       ),
                        leading: Image.asset('assets/images/expert3.jpg',
                             height:80,
                             width:80
                             ),
                             title: const Padding(
                                  padding: EdgeInsets.symmetric(
                               vertical:5
                             ),
                               child:Text('Patricia Hillston',
                               style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold,
                               ),
                               ),
                             ),
                             subtitle: const Text('Counsellor',
                               style: TextStyle(
                               fontSize: 13,
                               fontWeight: FontWeight.bold,
                               color: Colors.grey
                             ),
                             ),
                           ),
                             const SizedBox(height:10.0),
                ListTile(
                   onTap:(){},
                       trailing: Container(
                        decoration:  const BoxDecoration(
                         color:Color.fromARGB(255, 212, 238, 250),
                        ),
                         child: const Padding(
                           padding:  EdgeInsets.all(8.0),
                           child: Icon(Icons.chat_rounded,
                           color:  Colors.deepPurpleAccent,
                           ),
                         ),
                       ),
                        leading: Image.asset('assets/images/expert4.jpg',
                             height:80,
                             width:80
                             ),
                             title: const Padding(
                                  padding: EdgeInsets.symmetric(
                               vertical:5
                             ),
                               child:Text('Thomas micheal',
                               style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold,
                               ),
                               ),
                             ),
                             subtitle: const Text('Medical Doctor',
                               style: TextStyle(
                               fontSize: 13,
                               fontWeight: FontWeight.bold,
                               color: Colors.grey
                             ),
                             ),
                           ),
                              const SizedBox(height:10.0),
                ListTile(
                   onTap:(){},
                       trailing: Container(
                        decoration:  const BoxDecoration(
                         color:Color.fromARGB(255, 212, 238, 250),
                        ),
                         child: const Padding(
                           padding:  EdgeInsets.all(8.0),
                           child: Icon(Icons.chat_rounded,
                           color:  Colors.deepPurpleAccent,
                           ),
                         ),
                       ),
                        leading: Image.asset('assets/images/law1.png',
                             height:80,
                             width:80
                             ),
                             title: const Padding(
                                  padding: EdgeInsets.symmetric(
                               vertical:5
                             ),
                               child:Text('Janet jacob',
                               style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold,
                               ),
                               ),
                             ),
                             subtitle: const Text('Barrister',
                               style: TextStyle(
                               fontSize: 13,
                               fontWeight: FontWeight.bold,
                               color: Colors.grey
                             ),
                             ),
                           ),
               ],
            )
          ],
        ),
      )
    );
  }
}