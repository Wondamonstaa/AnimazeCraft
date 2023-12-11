import 'package:flutter/material.dart';

class ST extends PageRouteBuilder {
  final Widget child;

  ST({required this.child,}) :super(
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (context , animation, secondaryAnimation) => child,
  );

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) =>
  ScaleTransition(
    scale: animation,
    child: child,
  );
}