import 'package:flutter/material.dart';

class RT extends PageRouteBuilder {
  final Widget child;

  RT({required this.child,}) :super(
    transitionDuration: const Duration(seconds: 2),
    pageBuilder: (context , animation, secondaryAnimation) => child,
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeInOutCubicEmphasized),
        child: child,
      );

}