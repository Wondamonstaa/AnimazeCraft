import 'package:flutter/material.dart';
import 'dart:math';

class Balling extends StatelessWidget {

  const Balling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0x30171616),

      body: Center(
        child: TweenAnimationBuilder(
            duration: const Duration(seconds: 10),
            tween: Tween<double>(begin: 0, end: 5.0 * pi),
            builder: (_, double angle, __) {
              // Animation value should be same type as Tween typ
              return Transform.rotate(
                  angle: angle,
                  child:
                  Image.asset("./images/ball.gif", fit: BoxFit.contain, width: 220, height:  220,));
            }),
      ),

    );
  }
}
