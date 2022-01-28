import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/src/pages/navigation_page.dart';
import 'package:flutter_designs/src/pages/twitter_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimateDoScreen1 extends StatelessWidget {
  const AnimateDoScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
            duration: const Duration(milliseconds: 500),
            child: const Text('Animate_do')),
        actions: <Widget>[
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.twitter),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const TwitterScreen()));
            },
          ),
          SlideInLeft(
            from: 100,
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) =>
                            const AnimateDoScreen1()));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
            child: const FaIcon(FontAwesomeIcons.play),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const NavigationScreen()));
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(
                delay: const Duration(milliseconds: 1100),
                child: const Icon(Icons.new_releases,
                    color: Colors.blue, size: 40)),
            FadeInDown(
                delay: const Duration(milliseconds: 200),
                child: const Text('Titulo',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w200))),
            FadeInDown(
                delay: const Duration(milliseconds: 800),
                child: const Text('Soy un texto pequeño',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w400))),
            FadeInLeft(
              delay: const Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
