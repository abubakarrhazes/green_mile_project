import 'package:flutter/material.dart';

class DonationScreenThree extends StatefulWidget {
  const DonationScreenThree({super.key});

  @override
  State<DonationScreenThree> createState() => _DonationScreenThreeState();
}

class _DonationScreenThreeState extends State<DonationScreenThree> {
  var selectedPayment = "VISA";



 selectPayment(title){
    setState((){
       selectedPayment = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 2, 54),
      body:SingleChildScrollView(
        child:SafeArea(
          child: Padding(
            padding:const EdgeInsets.symmetric(
              horizontal:24
            ),
             child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
            const SizedBox(height:20),
            Row(
              children:[
                Image.asset('assets/images/prison2.jpg',
                height:100
                ),
                const SizedBox(width:16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width:120,
                      child: const Text('The Mukobeko Maximum Prison',
                      style:TextStyle(
                        color:Colors.white,
                        fontSize:20,
                        fontWeight:FontWeight.bold
                      )
                      ),
                    ),
                   const  SizedBox(height:10),
                    const Text('Zambia',
                    style:TextStyle(
                      color:Colors.grey,
                      fontSize:15,
                      fontWeight:FontWeight.bold
                    )
                    ),

                  ]
                )
              ]
            ),
             const SizedBox(height:30),
             Row(
              children:const <Widget>[
                Text('\$500',
                style:TextStyle(
                  fontSize:25,
                  color: Color.fromARGB(255, 255, 213, 0),
                  fontWeight:FontWeight.bold
                )
                ),
                  SizedBox(width:6),
                 Text('/ Minimum',
                style:TextStyle(
                  fontSize:20,
                  color: Colors.grey,
                  fontWeight:FontWeight.bold
                )
                )
              ]
             ),
               const SizedBox(height:30),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:const <Widget>[
                Text('About',
                  style:TextStyle(
                   fontSize:20,
                   color: Color.fromARGB(255, 145, 142, 142),
                   fontWeight:FontWeight.bold
                )
                ),
                   SizedBox(height:12),
                Text
                ('Mukobeko Maximum Prison is a one of most hardened prisons for highly dangerous criminals,However everyone deserve a second chance in which some of the prisoners can\'t get because of life sentences to imprisonment. However you can help them  provide them with basic needs so they can survive this choatic zone zone',
                  style:TextStyle(
                   fontSize:13,
                   color: Colors.grey,
                   fontWeight:FontWeight.bold
                )
                ),
                ]
               ),
               const SizedBox(height:30),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Payment Method',
                   style:TextStyle(
                      color:Colors.white,
                      fontSize:20,
                      fontWeight:FontWeight.bold
                    )
                  ),
                 const SizedBox(height: 12),
                 _selectPayment('VISA', 'assets/images/visa.png', ),
                  const SizedBox(height: 16),
                 _selectPayment('Master card', 'assets/images/mastercard.png'),
                  const SizedBox(height: 16),
                 _selectPayment('PayPal', 'assets/images/paypal.png')
                ],
               ),
               const SizedBox(height:40),
                 //  backgroundColor: Color.fromARGB(255, 255, 213, 0),
             InkWell(
               onTap: (){
                       Navigator.pushNamed(context, '/cardform');
              },
               child: Container(
                       width: double.infinity,
                       height: 50,
                       decoration: BoxDecoration(
                         color:const Color.fromARGB(255, 255, 213, 0),
                         borderRadius:BorderRadius.circular(30)   
                      ),
                     child: const Padding(
                       padding: EdgeInsets.all(10),
                     child: Center(
                       child: Text('Support Now',
                style:  TextStyle(
                        color:Color.fromARGB(255, 13, 2, 54),
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                ) 
                ),
                     ),
                        ),
                    ),
             ),
                   const SizedBox(height:20),  
            ]
          )
          ),
        )
      )
    );
  }

    Widget _selectPayment(String title,String image){
      return InkWell(
        onTap:(){
          selectPayment(title);
        },
        child:AnimatedContainer(
          curve:Curves.easeIn,
          duration:const Duration(milliseconds: 350),
           decoration: BoxDecoration(
            color: title == selectedPayment ? Colors.white :Colors.transparent,
            border: title == selectedPayment ? Border.all(width: 1,color:Colors.transparent)
            :Border.all(width:1,color: Colors.grey),
            borderRadius:BorderRadius.circular(24)   
         ),
        child:Container(
          width: double.infinity,
          height: 70,
        child: Padding(
          padding:const EdgeInsets.all(24),
        child: Row(
          children: <Widget>[
             Text(title,
            style: title == selectedPayment
             ? const TextStyle(
              color:Color.fromARGB(255, 13, 2, 54),
              fontSize: 20
            ) : const TextStyle(
              fontSize: 20,
              color:Colors.white
            ),    
            ),
         const Spacer(),
        Image.asset(image,
          height: 40,
          width:40
          )
                        ],
                      ),
                      ),
                  ),

        )
      );
    }
}