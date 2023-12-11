import 'package:flutter/material.dart';

class CustomScaleTrans3 extends PageRouteBuilder {
  final Widget child;

  CustomScaleTrans3({required this.child,}) :super(
    transitionDuration: const Duration(seconds: 3),
    pageBuilder: (context, animation, secondaryAnimation) => child,
  );

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {

    const double sourceOp = 0.0;
    const double targetOp = 2.0;
    const double sourceScale = 0.0;
    const double target = 1.0;

    final mistAdder = Tween<double>(
      begin: sourceOp,
      end: targetOp,
    ).animate(CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOutSine,
    ));

    final Scaler = Tween<double>(
      begin: sourceScale,
      end: target,
    ).animate(CurvedAnimation(
      parent: animation,
      curve: Curves.easeInCubic,
    ));

    return ScaleTransition(
      scale: Scaler,
      child: FadeTransition(
        opacity: mistAdder,
        child: child,
      ),
    );
  }
}
