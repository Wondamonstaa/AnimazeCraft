import 'package:flutter/material.dart';
import 'dart:math';

class Mist extends StatelessWidget {

  const Mist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x30171616),
      body: Center(
        child: TweenAnimationBuilder(
            duration: const Duration(seconds: 5),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (BuildContext context, double _val, Widget? child) {
              // Animation value should be same type as Tween typ
              return Opacity(
                  opacity: _val,
                  child: child
              );
            },
            child: Image.asset("./images/ball.gif", fit: BoxFit.fitHeight, width: 500, height: 500,)
            ),
      ),
    );
  }
}
