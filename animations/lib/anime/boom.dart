import 'dart:async';

import 'package:flutter/material.dart';


class BallExplode extends StatefulWidget {
  const BallExplode({Key? key}) : super(key: key);

  @override
  _BallExplode createState() => _BallExplode() ;
}

class _BallExplode extends State<BallExplode> {
  double widthSize = 140.0;
  double heightSize = 140.0;
  Timer? _timer;

  _BallExplode() {
    _timer = Timer(const Duration(milliseconds: 600), () {
      setState(() {
        widthSize = 420;
        heightSize = 420;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x30171616),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              width: widthSize,
              height: heightSize,
              duration: const Duration(seconds: 3),
              curve: Curves.elasticInOut,
              child: Image.asset("./images/ball.gif",
                  fit: BoxFit.cover,
                  width: 1000,
                  height:  1000),
            ),
          ],
        ),
      ),
    );
  }
}
