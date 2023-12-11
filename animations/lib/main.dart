/*
Name: Kiryl Baravikou
Project 4: Animations
Course: CS 378
Professor: Ugo Buy
Date: 11/29/2023
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animations/storage/helpers.dart';
import 'package:animations/start/rotateBox.dart';
import 'package:animations/start/boomBox.dart';
import 'package:animations/start/fadeBox.dart';
import 'package:animations/start/birotateBox.dart';
import 'package:animations/start/sharpBox.dart';
import 'package:animations/start/shotBox.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Animations';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xff282828),
        hintColor: const Color(0xff3af7ff),
        scaffoldBackgroundColor: const Color(0xff1c1c1c),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      title: _title,
      home: const Welcome(),
    );
  }
}

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Determine the current orientation
          final currentOrientation = MediaQuery.of(context).orientation;

          // Set the preferred orientation based on the current orientation
          SystemChrome.setPreferredOrientations(
            currentOrientation == Orientation.portrait
                ? [DeviceOrientation.landscapeRight]
                : [DeviceOrientation.portraitDown],
          );
        },
        backgroundColor: const Color(0xff3af7ff),
        child: const Icon(Icons.rotate_left, color: Colors.black),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      appBar: AppBar(title: const Text(MyApp._title), backgroundColor: const Color(0xff282828)),
      backgroundColor: const Color(0xff1c1c1c),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: animations.length,
        itemBuilder: (BuildContext context, int index) {
          return _returnContainer(index, context);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  Widget _returnContainer(int index, BuildContext context) {
    final storage = {
      0: const RotateBox(i: 0),
      1: const BoomBox(i: 1),
      2: const FadeBox(i: 2),
      3: const BiBox(i: 3),
      4: const SharpBox(i: 4),
      5: const ShotBox(i: 5),
    };


    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          // Set landscape orientation when navigating to Animation screen
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitDown,
            DeviceOrientation.portraitUp,
          ]);
          print("EXECUTED ON TAP");
          return _returnContainer(index, context);
        }));
      },
      child: storage[index] ?? Container(),
    );
  }
}
