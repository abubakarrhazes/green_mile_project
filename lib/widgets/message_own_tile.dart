import 'package:flutter/material.dart';
import 'package:green_mile/widgets/avatar.dart';


class MessageOwnTile extends StatelessWidget {
// ignore: use_key_in_widget_constructors
  const MessageOwnTile ({
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
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child:Expanded(
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 250,
                    decoration: const BoxDecoration(
                        color:Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(_borderRadius),
                          bottomLeft: Radius.circular(_borderRadius),
                          bottomRight: Radius.circular(_borderRadius),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 20.0,
                      ),
                      child: Text(message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
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
                         'Jennifer - ', 
                          style:  TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          messageDate,
                          style: const TextStyle(
                            color:Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5.0),
               const Avatar.small(
                img: NetworkImage('https://www.shutterstock.com/image-photo/close-face-young-stylish-woman-600w-1671900778.jpg')
                ),
            ],
          ),
        ),
      ),
    );
  }
}
