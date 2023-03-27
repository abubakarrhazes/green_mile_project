import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle:true,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
             padding: const EdgeInsets.only(
                right:20
              ),
            itemBuilder:(context) =>[
                PopupMenuItem(  
                    onTap:(){
                       Navigator.pushNamed(context, '/chat');
                    },
                    child: const Text('Live chat',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, 
                        color:  Colors.deepPurpleAccent,
                        fontSize: 14.0,      
                    )
                    ),
               ),
                PopupMenuItem(  
                    onTap:(){
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('Main Page',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,  
                        color:  Colors.deepPurpleAccent,
                        fontSize: 14.0,      
                    )
                    ),
               )
            ],
             icon: const Icon(Icons.menu,
               color: Colors.deepPurpleAccent,
               ),
          )
        ],
        title: const Text('Reach The Support Team',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17
        ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            right: 20
          ),
          child: IconButton(
             padding: const EdgeInsets.only(
              left:20
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(Icons.arrow_back,
                 color: Colors.deepPurpleAccent),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Image.network('https://cdn-icons-png.flaticon.com/512/8019/8019048.png', // will change it later
          height: 120,
          ),
          const SizedBox(height: 20),
           SizedBox(
            width:270,
             child: Text('How can we help',
             style: TextStyle(
                fontSize: 35,
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
           ),
             const SizedBox(height: 5),
           Align(
            alignment:Alignment.center,
             child: Text('You?',
             style: TextStyle(
                fontSize: 35,
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
           ),
           const SizedBox(height: 35),
          InkWell(
            splashColor:Colors.deepPurpleAccent,
            onTap: (){
              Navigator.pushNamed(context, '/chat');
            },
            child: Container(
              height:50,
              padding:const EdgeInsets.only(
                left:20,
                right:20
              ),
              margin:const EdgeInsets.only(
                left:20,
                right:20
              ),
              decoration: BoxDecoration(
                color:const Color.fromARGB(255, 212, 238, 250),
                shape:BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child:Row(
                children:<Widget>[
                const SizedBox(
                  height: 30,
                  width: 30,
                  child:  Icon(
                    Icons.headphones_outlined,
                    size: 20,
                    color: Color.fromARGB(255, 5, 133, 193),
                  )
                ),
                const SizedBox(width:10.0),
                const Text('Contact Live Chat',
                style:TextStyle(
                  color:Colors.black,
                  fontWeight:FontWeight.bold,
                  fontSize:15
                )
                ),
                 Expanded(child:Container()),
                 const Icon(Icons.keyboard_arrow_right_outlined,
                  size: 20,
                  color: Color.fromARGB(255, 5, 133, 193)
                 ),
                ]
              )
            ),
          ),
              const SizedBox(height:30.0),
              Column(
                children: <Widget>[
                  Container(
                    height:50,
                    decoration:const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 212, 238, 250),
                    ),
                    child:const Padding(
                      padding: EdgeInsets.all(10.0),
                      child:  Icon(
                        Icons.email_outlined,
                        size: 20,
                        color: Color.fromARGB(255, 5, 133, 193)
                      ),
                    )
                  ),
                  const SizedBox(height:20.0),
                  const Text('Send us an email',
                  style: TextStyle(
                    color:Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13
                  ),
                  ),
                  const SizedBox(height:5.0),
                  const Text('info@Greenmile.io',
                  style: TextStyle(
                    color:Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                  )

                ],
              )
        ]
      ),
    );
  }
}