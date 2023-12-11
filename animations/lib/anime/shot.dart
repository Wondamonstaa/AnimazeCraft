import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Shot extends StatefulWidget {
  const Shot({Key? key}) : super(key: key);

  @override
  _Shot createState() => _Shot();
}

class _Shot extends State<Shot> with SingleTickerProviderStateMixin {
  bool reversed = false;
  double curValue = 0.0;
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();

    _animation = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -1.2))
        .animate(_controller);

    _controller.addListener(() {
      setState(() {});
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
        textDirection: TextDirection.ltr,
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                SlideTransition(
                  position: _animation,
                  child: Image.asset(
                    "./images/ball.gif",
                    fit: BoxFit.fill,
                    width: 250.0,
                    height: 250.0,
                    repeat: ImageRepeat.repeat,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10.0), // Adding padding between image and buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                  focusNode: FocusNode(),
                  onFocusChange: (hasFocus) {
                    if (hasFocus) {
                      _controller.repeat();
                    } else {
                      _controller.stop();
                    }
                  },
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
                    _controller.isAnimating ? _controller.stop() : _controller.repeat();
                  },
                  child: const Text('Begin'),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
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
                  child: const Text('Reverse',
                    selectionColor: DefaultSelectionStyle.defaultColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
