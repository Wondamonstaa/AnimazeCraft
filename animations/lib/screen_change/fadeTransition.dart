import 'package:flutter/material.dart';

class FadeTrans extends PageRouteBuilder {
  final Widget baby;

  FadeTrans({required this.baby,}) : super(
    transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (context, animation, secondaryAnimation) => baby,
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const curve = Curves.easeOutQuart;

    var fadeIn = Tween(begin: 0.0, end: 5.0).animate(
      CurvedAnimation(parent: animation, curve: curve),
    );

    return FadeTransition(
      opacity: fadeIn,
      child: child,
    );
  }
}
