import 'package:flutter/material.dart';
import 'package:green_mile/widgets/avatar.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({
    this.size = 100,
  });



  final double size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:SingleChildScrollView(
       child: Column(
        children:<Widget>[
          Container(
            padding:const EdgeInsets.only(
                top:50,
                left:20,
              ),
              child:Row(
                children:<Widget>[
                 const Avatar.medium(
                    img: NetworkImage('https://www.shutterstock.com/image-photo/close-face-young-stylish-woman-600w-1671900778.jpg')
                ),
                 Padding(
                  padding:const EdgeInsets.symmetric(
                    horizontal:10.0
                  ),
                  child:Column(
                    children:const <Widget> [
                      Text(
                        'Hello,Jennifer',
                        style: TextStyle(
                         fontSize: 11,
                         color: Colors.grey,
                         fontWeight: FontWeight.bold
                 ),
                        ),
                       Text(
                        'Complete your Profile',
                        style: TextStyle(
                         fontSize: 11,
                         color: Colors.deepPurpleAccent,
                         fontWeight: FontWeight.bold
                 ),
                        ),
                    ],
                  ),
                ),
                  Expanded(
                     child:Container()
                   ),
                   Column(
                    children:const <Widget>[
                      Text('USA,California',
                      style:TextStyle(
                        fontSize:11,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis
                      ),
                      ),
                       SizedBox(height:5), 
                      Text('See your location',
                      style:TextStyle(
                        fontSize:11,
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis
                      ),
                      )
                    ]
                   ),
                   const SizedBox(width:10), 
                  const  Padding(
                     padding:  EdgeInsets.only(
                      right: 20
                     ),
                     child:  Icon(Icons.location_on,
                        color: Colors.deepPurpleAccent,
                        size:20
                 ),
                   ),
                ]
              ),
          ),
          const  SizedBox(height:120), 
          Center(
            child: Column(
              children: [
                const Text('Emergency Help',
                style: TextStyle(
                  color:Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),
                ),
                const  SizedBox(height:20), 
                const Text('Needed?',
                style: TextStyle(
                  color:Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),
                ),
                const  SizedBox(height:30), 
                const Text('Just hold the button to call',
                style: TextStyle(
                  color:Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
                 const  SizedBox(height:40),
                Container(
                   decoration: BoxDecoration(
                   border:Border.all(width: 5,color:Colors.grey),
                   color: Colors.deepPurpleAccent,
                   shape: BoxShape.circle,
         boxShadow: [
           BoxShadow(
                color: Colors.deepPurpleAccent.withOpacity(0.4),
                blurRadius: 24,
                spreadRadius: 10,
                //offset: const Offset(-22, 0),
          ),
        ]
      ),
       child: ClipOval(
        child: Material(
          color: Colors.deepPurpleAccent,
          child: InkWell(
                splashColor: Colors.grey,
                onTap: (){},
                child: SizedBox(
                  width: size,
                  height: size,
                  child: const Icon(
                    Icons.wifi,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
          ),
        ),
      ),

                ),
              ],
            ),
          )
        ]
       ),
     )
    );
  }
}