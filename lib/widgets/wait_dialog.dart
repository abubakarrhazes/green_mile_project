import 'package:flutter/material.dart';

Future showWaitDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Row(
          children: const [
            CircularProgressIndicator(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text('loading...'),
            )
          ],
        ),
      );
    },
  );
}
