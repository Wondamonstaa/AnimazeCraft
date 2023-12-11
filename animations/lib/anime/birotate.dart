import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class DancingPancake extends StatefulWidget {
  const DancingPancake({Key? key}) : super(key: key);

  @override
  _DancingPancake createState() => _DancingPancake();
}

class _DancingPancake
    extends State<DancingPancake>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOutSine,
  );

  bool reversed = false;

  @override
  void dispose() {
    // Don't forget to deallocate AnimationController
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x30171616),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
        crossAxisAlignment: CrossAxisAlignment.center, //Center Column contents horizontally,
        children: <Widget>[
          Center(
            // RotationTransition is an explicit animation
            child: RotationTransition(
              turns: _animation,
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                //child: Icon(Icons.account_balance_wallet_rounded, size: 150.0, color: Colors.white),
                child: Image.asset("./images/ball.gif", fit: BoxFit.fill, width: 220.0, height: 220.0),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10.0)),
          TextButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(const Size(100, 50)),
              surfaceTintColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
              overlayColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
              splashFactory: NoSplash.splashFactory,
              iconColor: MaterialStateProperty.all<Color>(Colors.white),
              shadowColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff3fcacf)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              _controller.isAnimating
                  ? _controller.stop()
                  : _controller.repeat();
            },
            child: const Text('Start/Stop'),
          ),
          const Padding(padding: EdgeInsets.all(10.0)),
          TextButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(const Size(100, 50)),
              surfaceTintColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
              overlayColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
              splashFactory: NoSplash.splashFactory,
              iconColor: MaterialStateProperty.all<Color>(Colors.white),
              shadowColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff3fcacf)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              setState(() {
                reversed = !reversed;
              });
              if (kDebugMode) {
                print(reversed);
              }
              _controller.repeat(reverse: reversed);
            },
            child: const Text('Reverse'),
          )
        ],
      )
    );
  }
}
