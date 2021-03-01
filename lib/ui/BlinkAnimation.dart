

import 'package:alvin_portfolio_app/utils/Strings.dart';
import 'package:flutter/material.dart';

class BlinkAnimation extends StatefulWidget {
  @override
  _BlinkAnimationState createState() => _BlinkAnimationState();
}

class _BlinkAnimationState extends State<BlinkAnimation>
    with SingleTickerProviderStateMixin {
  Animation<Color> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    final CurvedAnimation curve =
    CurvedAnimation(parent: controller, curve: Curves.linear);
    animation =
        ColorTween(begin: Colors.white, end: Colors.orange).animate(curve);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return new Container(
            child: Text(
              Strings.THANGADURAI_SELVARAJ,
              style: TextStyle(
                fontFamily: "Merriweather",
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: animation.value,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
