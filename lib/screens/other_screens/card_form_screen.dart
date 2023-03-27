import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';


class CardFormScreen extends StatelessWidget {
  const CardFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle:true,
        automaticallyImplyLeading: false,
         leading: Padding(
          padding: const EdgeInsets.only(
            right: 20
          ),
          child: IconButton(
             padding: const EdgeInsets.only(
              left:20
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,
                 color: Colors.deepPurpleAccent),
          ),
        ),
         title: const Text('Pay with a Credit Card',
        style: TextStyle(
          color:Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17
        ),
        ),
      ),
      body: Column(
         mainAxisAlignment:MainAxisAlignment.start,
         crossAxisAlignment:CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('CardForm',
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
            const SizedBox(height:20),
          CardFormField(
            controller:CardFormEditController(),
          ),
             const SizedBox(height:10),
              Container(
                      height:60,
                      width:330,
                      decoration:  const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 41, 167, 226),
                            Colors.deepPurpleAccent,
                            Colors.indigo,
                          ]
                          )
                      ),
                      child: const Center(
                        child: Text('PAY',
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                        ),
                      ),
                    )

        ],
      ),
    );
  }
}