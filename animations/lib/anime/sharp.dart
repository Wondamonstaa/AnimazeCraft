import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class Hitter extends StatefulWidget {
  const Hitter({Key? key}) : super(key: key);

  @override
  _Hitter createState() => _Hitter();
}

//Mixins involved
class _Hitter extends State<Hitter> with SingleTickerProviderStateMixin {

  bool reversed = false;
  double curValue = 0.0;
  late final AnimationController _controller;
  late final Animation<double> _animation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
    
    _controller.addListener(() {
      setState(() {
        curValue = _controller.value;
      });
    });
  }

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
            child: Column(
                children: <Widget>[
                  RotationTransition(
                    alignment: Alignment.center,
                    turns: Tween<double>(begin: 0, end: 1).animate(_animation),
                    child: Image.asset("./images/ball.gif", fit: BoxFit.cover, width: 200.0, height: 200.0),
                  ),
                ],
              )
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
              child: Text('Start/Stop'),
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
                print(reversed);
                _controller.repeat(reverse: reversed);
              },
              child: const Text('Reverse'),
            )
          ],
        )
    );
  }
}
