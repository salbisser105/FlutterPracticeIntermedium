import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterScreen extends StatefulWidget {
  const TwitterScreen({Key? key}) : super(key: key);

  @override
  State<TwitterScreen> createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {
  bool activar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(FontAwesomeIcons.play),
        onPressed: () {
          activar = true;
          print('hola ');
          setState(() {});
        },
      ),
      backgroundColor: const Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
            animate: true,
            from: 20,
            delay: const Duration(seconds: 3),
            child: const Icon(FontAwesomeIcons.twitter,
                color: Colors.white, size: 40)),
      ),
    );
  }
}
