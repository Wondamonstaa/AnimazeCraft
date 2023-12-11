import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animations/anime/boom.dart';
import 'package:animations/anime/rotate.dart';
import 'package:animations/anime/fade.dart';
import 'package:animations/anime/birotate.dart';
import 'package:animations/anime/sharp.dart';
import 'package:animations/anime/shot.dart';
import '../storage/helpers.dart';
import '../start/rotateBox.dart';
import '../start/boomBox.dart';
import '../start/fadeBox.dart';
import '../start/birotateBox.dart';
import '../start/sharpBox.dart';
import '../start/shotBox.dart';
import '../main.dart';


class Jinx extends StatefulWidget {
  final int animationNumber;
  final String descr;
  final bool isSelected;

  const Jinx({Key? key, required this.animationNumber, required this.descr, required this.isSelected}) : super(key: key);

  static const animationClasses = [
    Balling(),
    BallExplode(),
    Mist(),
    DancingPancake(),
    Hitter(),
    Shot(),
  ];

  @override
  _Animation createState() => _Animation();
}

class _Animation extends State<Jinx> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _containerList = [
    const RotateBox(i: 0),
    const BoomBox(i: 1),
    const FadeBox(i: 2),
    const BiBox(i: 3),
    const SharpBox(i: 4),
    const ShotBox(i: 5),
  ];

  @override
  void initState() {
    super.initState();
    // Set portrait orientation when returning to the main screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press here
        if (_scaffoldKey.currentState!.isDrawerOpen) {
          Navigator.pop(context); // Close the drawer
          return false; // Don't exit the app
        }
        return true; // Allow app exit
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: const Text('Running'), backgroundColor: const Color(0xff282828)),
        backgroundColor: const Color(0xff1c1c1c),
        body: Row(
          children: [
            Flexible(
              flex: 1, // 25%
              fit: FlexFit.loose,
              child: Drawer(
                backgroundColor: const Color(0xff1c1c1c),
                child: Container(
                  color: const Color(0xffffffff),
                  child: ListView.builder(
                    dragStartBehavior: DragStartBehavior.down,
                    //physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: _containerList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: SizedBox(
                          height: 75, // Adjust the height as needed
                          child: _containerList[index],
                        ),
                        onTap: () {
                          const NavigationRailDestination(
                            icon: Icon(Icons.animation),
                            selectedIcon: Icon(Icons.animation),
                            label: Text('Animation'),
                          );
                          Navigator.pop(context); // Close the drawer
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              settings: const RouteSettings(name: '/'),
                              builder: (_) => const MyApp(),
                              maintainState: false
                            ),
                          );
                        },
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(message[index]),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Got you!'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      );
                    },
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3, // 75%
              child: Jinx.animationClasses[widget.animationNumber],
            ),
          ],
        ),
      ),
    );
  }
}

