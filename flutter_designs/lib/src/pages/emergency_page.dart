import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_designs/src/wigets/fat_button_widget.dart';
import 'package:flutter_designs/src/wigets/headers_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPageScreen extends StatelessWidget {
  const EmergencyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <FatButtonWidget>[
      FatButtonWidget(
        icon: FontAwesomeIcons.carCrash,
        texto: 'Motor Accident',
        onPress: () {},
        color1: const Color(0xff6989F5),
        color2: const Color(0xff906EF5),
      ),
      FatButtonWidget(
        icon: FontAwesomeIcons.plus,
        texto: 'Medical Emergency',
        onPress: () {},
        color1: const Color(0xff6989F5),
        color2: const Color(0xff536CF6),
      ),
      FatButtonWidget(
        icon: FontAwesomeIcons.theaterMasks,
        texto: 'Theft / Harrasement',
        onPress: () {},
        color1: const Color(0xffF2D572),
        color2: const Color(0xffE06AA3),
      ),
      FatButtonWidget(
          icon: FontAwesomeIcons.biking,
          texto: 'Awards',
          onPress: () {},
          color1: const Color(0xff317183),
          color2: const Color(0xff46997D)),
    ];
    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
          duration: const Duration(milliseconds: 250),
              child: FatButtonWidget(
                  icon: item.icon,
                  texto: item.texto,
                  color1: item.color1,
                  color2: item.color2,
                  onPress: item.onPress),
            ))
        .toList();

    return Scaffold(
        body: Stack(children: <Widget>[
      const _Encabezado(),
      Container(
        margin: const EdgeInsets.only(top: 200),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[const SizedBox(height: 100.0), ...itemMap],
        ),
      ),
    ]));
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      const IconHeaderWidget(
        icon: FontAwesomeIcons.plusCircle,
        titulo: 'Asistencia Médica',
        subtiltulo: 'Haz solicitado',
      ),
      Positioned(
          right: 10,
          top: 40,
          child: RawMaterialButton(
              onPressed: () {},
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
              child:
                  const Icon(FontAwesomeIcons.ellipsisV, color: Colors.white)))
    ]);
  }
}
