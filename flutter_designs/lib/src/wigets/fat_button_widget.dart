import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButtonWidget extends StatelessWidget {
  const FatButtonWidget({
    Key? key,
    required this.icon,
    required this.texto,
    this.color1 = const Color(0xff6989F5),
    this.color2 = const Color(0xff906EF5),
    required this.onPress,
  }) : super(key: key);

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: <Widget>[
          _FatButtonBackGround(
            color1: color1,
            color2: color2,
            icon: FontAwesomeIcons.carCrash,
          ),
          Row(
            children: [
              const SizedBox(height: 140, width: 40),
              Icon(icon, color: Colors.white, size: 40),
              const SizedBox(width: 20),
              Text(texto,
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(width: 40),
              const Icon(FontAwesomeIcons.chevronRight, color: Colors.white)
            ],
          )
        ],
      ),
    );
  }
}

class _FatButtonBackGround extends StatelessWidget {
  const _FatButtonBackGround({
    Key? key,
    required this.icon,
    required this.color1,
    required this.color2,
  }) : super(key: key);
  final IconData icon;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              child:
                  Icon(icon, size: 150, color: Colors.white.withOpacity(0.2)),
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(4, 6),
                blurRadius: 10),
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: <Color>[color1, color2])),
    );
  }
}

//
