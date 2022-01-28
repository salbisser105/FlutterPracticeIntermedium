import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSquare(),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> rotation;

  late Animation<double> opacidad;
  late Animation<double> opacidadOut;

  late Animation<double> moverDerecha;
  late Animation<double> agrandar;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    rotation = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.25, curve: Curves.easeOut)));

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    agrandar = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reverse();
        // animationController.repeat();
        // animationController.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Play
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        // child: const _Square(),
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(/*100*/moverDerecha.value , 0),
            child: Transform.rotate(
              angle: rotation.value,
              child: Opacity(
                opacity: opacidad.value- opacidadOut.value,
                child: Transform.scale(
                  scale: agrandar.value/*1.5*/,
                  child: const _Square(),
                ),
              ),
            ),
          );
        });
  }
}

class _Square extends StatelessWidget {
  const _Square({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
