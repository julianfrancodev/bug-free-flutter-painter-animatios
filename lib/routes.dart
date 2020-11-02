import 'package:custom_painter/labs/slideshow_page.dart';
import 'package:custom_painter/pages/animations_page.dart';
import 'package:custom_painter/pages/circular_graphics_page.dart';
import 'package:custom_painter/pages/emergency_page.dart';
import 'package:custom_painter/pages/header_page.dart';
import 'package:custom_painter/pages/pinterest_page.dart';
import 'package:custom_painter/pages/slideshow_page.dart';
import 'package:custom_painter/pages/sliver_list_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, "SlideShow", SlidesShowPage()),
  _Route(FontAwesomeIcons.ambulance, "Emergencia", EmergencyPage()),
  _Route(FontAwesomeIcons.heading, "Ecabezados", HeaderPage()),
  _Route(FontAwesomeIcons.peopleCarry, "Cuadro Animado", AnimationsPage()),
  _Route(FontAwesomeIcons.circleNotch, "Barra de progreso", CircularGraphics()),
  _Route(FontAwesomeIcons.pinterest, "Pinterest", PinteresPage()),
  _Route(FontAwesomeIcons.mobile, "Slivers", SliverListPage()),
];

class _Route {
  final IconData iconData;
  final String titulo;
  final Widget page;

  _Route(this.iconData, this.titulo, this.page);
}
