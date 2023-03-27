import 'package:flutter/material.dart';

class DonationRegisterScreen extends StatelessWidget {
  const DonationRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height:80),
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/5862/5862869.png',
                  height: 150,
                  fit: BoxFit.contain,
                  ), 
              const SizedBox(
                height: 20,
              ),
           Expanded(
            child: Form(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/2.15),
                  TextFormField(
                    style: const TextStyle(
                      color: Colors.black
                    ),
                    decoration:  InputDecoration(
                      filled:true,
                      fillColor:Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 3
                        ),
                      ),
                       labelText:'Name of Organisation',
                       labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize:17
                       )
                    ),
                  ),
                  const SizedBox(height:10),
                  TextFormField(
                    obscureText: true,
                    style: const TextStyle(
                      color: Colors.black
                    ),
                    decoration:  InputDecoration(
                      filled:true,
                      fillColor:Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 3
                        ),
                      ),
                       labelText:'Location',
                       labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize:17
                       )
                    ),
                  ),
                   const SizedBox(height:10),
                  TextFormField(
                    obscureText: true,
                    style: const TextStyle(
                      color: Colors.black
                    ),
                    decoration:  InputDecoration(
                      filled:true,
                      fillColor:Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 3
                        ),
                      ),
                       labelText:'Country',
                       labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize:17
                       )
                    ),
                  ),
                   const SizedBox(height:10),
                  TextFormField(
                    obscureText: true,
                    style: const TextStyle(
                      color: Colors.black
                    ),
                    decoration:  InputDecoration(
                      filled:true,
                      fillColor:Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 3
                        ),
                      ),
                       labelText:'Email',
                       labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize:17
                       )
                    ),
                  ),
                    const SizedBox(height:20),
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
                        child: Text('Register Now',
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                        ),
                      ),
                    )
                ],
              )
              ),
          ),
            ],
          ),
         
        ),
    );
  }
}