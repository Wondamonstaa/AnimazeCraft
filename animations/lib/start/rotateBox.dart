import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animations/anime/rotate.dart';
import 'package:animations/storage/helpers.dart';
import 'package:animations/screen_change/hitTransition.dart';
import 'package:animations/screens/Animation.dart';

class RotateBox extends StatefulWidget {
  final int i;

  const RotateBox({Key? key, required this.i}) : super(key: key);

  @override
  _RotateBox createState() => _RotateBox();
}

class _RotateBox extends State<RotateBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          isSelected = !isSelected;
        });

        await Navigator.of(context).push(
          ST(
            child: Jinx(
              animationNumber: widget.i,
              descr: message[widget.i],
              isSelected: isSelected,
            ),
          ),
        );

        // This code runs when the pushed route is popped
        setState(() {
          isSelected = false;
        });
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xfffae251) : const Color(0xff232326),
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
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
