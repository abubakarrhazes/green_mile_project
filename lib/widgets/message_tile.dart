import 'package:flutter/material.dart';
import 'package:green_mile/widgets/avatar.dart';

class MessageTile extends StatelessWidget {
// ignore: use_key_in_widget_constructors
  const MessageTile ({
    required this.message,
    required this.messageDate,
    });

  final String message;
  final String messageDate;



 // final Message message;
  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 2.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Expanded(
          child: Row(
            children: [
              const Avatar.small(
                img: AssetImage('assets/images/logo.jpg')
                ),
              const SizedBox(width: 5.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 250,
                    decoration:  const BoxDecoration(
                        color:  Color.fromARGB(255, 212, 238, 250),
                        borderRadius:BorderRadius.only(
                          topLeft: Radius.circular(_borderRadius),
                          topRight: Radius.circular(_borderRadius),
                          bottomRight: Radius.circular(_borderRadius),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 20.0,
                      ),
                      child: Text(message,
                      style:const TextStyle(
                            color: Color.fromARGB(255, 5, 133, 193),
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top:8.0,
                      left: 10.0,
                      ),
                    child: Row(
                      children: [
                         const Text(
                         'Hannah - ', 
                          style:  TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                         messageDate, 
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}