import '../anime/birotate.dart';
import '../anime/boom.dart';
import '../anime/fade.dart';
import '../anime/rotate.dart';
import '../anime/sharp.dart';
import '../anime/shot.dart';
import '../start/birotateBox.dart';
import '../start/boomBox.dart';
import '../start/fadeBox.dart';
import '../start/rotateBox.dart';
import '../start/sharpBox.dart';
import '../start/shotBox.dart';


const animationClasses = [
  Balling(),
  BallExplode(),
  Mist(),
  DancingPancake(),
  Hitter(),
  Shot(),
];

const animationList = [
  RotateBox(i: 0),
  BoomBox(i: 1),
  FadeBox(i: 2),
  BiBox(i: 3),
  SharpBox(i: 4),
  ShotBox(i: 5),
];

const message = ['Rotates the image 90 degrees to the right.',
  'Explodes the image.',
  'Slowly fades the image.',
  'Makes the image move both 180 degrees left and right',
  'Makes the image imitate the hit.',
  'Bouncing ball imitation.'];

const animations = ['Rotate', 'Boom', 'Fade', 'Bi-Rotate', 'Hit', 'Shot'];


