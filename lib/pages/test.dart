import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
// import 'package:get/get.dart';

class TestSplash extends StatefulWidget {
  const TestSplash({super.key});

  @override
  State<TestSplash> createState() => _TestSplashState();
}

class _TestSplashState extends State<TestSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Tween<double> tween;
  late Animation<double> animation;
  ByteData? image;

  @override
  void initState() {
    super.initState();
    _initImage();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    tween = Tween<double>(begin: 10, end: 1);
    final Animation<double> curve =
        CurvedAnimation(parent: animationController, curve: Curves.ease);
    animation = tween.animate(curve);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        'Hello World',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  void _initImage() async {
    image = await rootBundle.load('');
    setState(() {});
  }
}

class SplashPainter extends CustomPainter {
  Animation<double> anim;
  List<Offset> path = [];
  List<Offset> path2 = [];
  ByteData? image;
  ui.Image? img;
  SplashPainter(this.anim, this.image) : super(repaint: anim) {
    _generate();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();

    for (var i = 0; i < path.length; i++) {
      if (i % 5 == 0 && img != null) {
        canvas.drawImage(
          img!,
          Offset(
            path[i].dx - ((path[i].dx - path2[i].dx) / anim.value),
            path[i].dy - ((path[i].dy - path2[i].dy) / anim.value),
          ),
          Paint(),
        );
      } else {
        p.addOval(
          Rect.fromCircle(
            center: Offset(
              path[i].dx - ((path[i].dx - path2[i].dx) / anim.value),
              path[i].dy - ((path[i].dy - path2[i].dy) / anim.value),
            ),
            radius: i.isEven ? 10 : 7,
          ),
        );
      }
    }

    canvas.drawPath(
        p, Paint()..color = const Color.fromRGBO(33, 149, 243, 0.577));
  }

  @override
  bool shouldRepaint(SplashPainter oldDelegate) => true;

  @override
  bool shouldRebuidSemantics(SplashPainter oldDelegate) => true;

  void _generate() async {
    for (var i = 0; i < 40; i++) {
      path.add(
        // Offset(
        //   Random().nextDouble() * Get.width * 1.5,
        //   Random().nextDouble() * Get.height * 1.5,
        // ),
        Offset(
          Random().nextDouble() * 90 * 1.5,
          Random().nextDouble() * 90 * 1.5,
        ),
      );
      path2.add(
        // Offset(
        //   Random().nextDouble() * Get.width * 1.5,
        //   Random().nextDouble() * Get.height * 1.5,
        // ),
        Offset(
          Random().nextDouble() * 80 * 1.5,
          Random().nextDouble() * 80 * 1.5,
        ),
      );
    }

    if (image != null) {
      final codec = await ui.instantiateImageCodec(
        image!.buffer.asUint8List(),
        targetHeight: 30,
        targetWidth: 30,
      );

      img = (await codec.getNextFrame()).image;
    }
  }
}
