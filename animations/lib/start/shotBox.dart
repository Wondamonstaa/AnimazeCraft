import 'package:flutter/material.dart';
import 'package:animations/storage/helpers.dart';
import 'package:animations/screens/Animation.dart';

class ShotBox extends StatefulWidget {
  final int i;

  const ShotBox({Key? key, required this.i}) : super(key: key);

  @override
  _ShotBox createState() => _ShotBox();
}

class _ShotBox extends State<ShotBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          isSelected = true;
        });

        await Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: Jinx(animationNumber: widget.i, descr: message[widget.i], isSelected: isSelected,),
              );
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween(begin: const Offset(0.0, -1.0), end: Offset.zero).animate(animation),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );

        setState(() {
          isSelected = false;
        });
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xfffae251) : const Color(0xff232323),
          border: Border.all(
            color: const Color(0xff3af7ff),
            width: 3,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            animations[widget.i],
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

