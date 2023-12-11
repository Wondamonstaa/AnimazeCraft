import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animations/storage/helpers.dart';
import 'package:animations/screen_change/fadeTransition.dart';
import 'package:animations/screens/Animation.dart';

import '../screen_change/rotateTransition.dart';

/// This is the main application widget.
class BiBox extends StatefulWidget {
  final int i;

  const BiBox({Key? key, required this.i}) : super(key: key);

  @override
  _BiBox createState() => _BiBox();
}

class _BiBox extends State<BiBox> {
  bool isSelected = false;
  bool isCurrent = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.yellow,
      onTap: () async{
        print("EXECUTED ON TAP");
        setState(() {
          isSelected = !isSelected;
        });

        // Only push the route if the condition is met
        if (isSelected) {
          await Navigator.of(context).push(
            RT(child: Jinx(animationNumber: widget.i, descr: message[widget.i], isSelected: !isSelected)),
          );
        }
        else {
          await Navigator.of(context).push(
            FadeTrans(baby: Jinx(animationNumber: widget.i, descr: message[widget.i], isSelected: !isSelected)),
          );
        }
        // This code runs when the pushed route is popped
        setState((){
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


