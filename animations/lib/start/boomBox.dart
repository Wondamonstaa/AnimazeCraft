import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animations/anime/rotate.dart';

import 'package:animations/storage/helpers.dart';
import 'package:animations/screen_change/hitTransition.dart';
import 'package:animations/screen_change/shotTransition.dart';
import 'package:animations/screens/Animation.dart';

/// This is the main application widget.
class BoomBox extends StatefulWidget  {
  final int i;
  const BoomBox({Key? key, required this.i}) : super(key: key);

  @override
  _BoomBox createState() => _BoomBox();
}

class _BoomBox extends State<BoomBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          isSelected = !isSelected;
        });

        await Navigator.of(context).push(
          SlideTrans(
            child: Jinx(
              animationNumber: widget.i,
              descr: message[widget.i],
              isSelected: isSelected,
            ),
            offsetX: -1,
            offsetY: 0,
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

