import 'package:flutter/material.dart';

//From flutter examples
class SlideTrans extends PageRouteBuilder {
  final Widget child;
  final double offsetX;
  final double offsetY;

  SlideTrans({
    required this.child,
    required this.offsetX,
    required this.offsetY
  }) :super(
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (context , animation, secondaryAnimation) => child,
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: Offset(offsetX, offsetY),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );

}