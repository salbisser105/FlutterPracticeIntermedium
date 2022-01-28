import 'package:flutter/material.dart';
import 'package:flutter_designs/src/pages/animate_do1_page.dart';
import 'package:flutter_designs/src/pages/circular_progress_page.dart';
import 'package:flutter_designs/src/pages/emergency_page.dart';
import 'package:flutter_designs/src/pages/headers_page.dart';
import 'package:flutter_designs/src/pages/pinterest_page.dart';
import 'package:flutter_designs/src/pages/slider_list_page.dart';
import 'package:flutter_designs/src/pages/slideshow_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', const SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', const EmergencyPageScreen()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', const HeadersPage()),
  _Route(
      FontAwesomeIcons.peopleCarry, 'Cuadro Animado', const AnimateDoScreen1()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra Progreso',
      const CircularProgressPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliderListScreen()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
