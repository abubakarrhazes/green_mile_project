import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

   ResponsiveButton({
    this.isResponsive = false,
    this.width = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite:width,
        height: 50,
        decoration:  BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 20
              ),
              child: const Text('Hire Now',
              style: TextStyle(
                 color:Colors.white,
                 fontSize: 25
              ),
              ),
            ),
           Container(
            margin:const EdgeInsets.only(
              right:20
            ),
             child: const Icon(Icons.arrow_circle_right_outlined,
             size: 30,
             color:Colors.white
             ),
           )

          ],
        ),
      ),
    );
  }
}