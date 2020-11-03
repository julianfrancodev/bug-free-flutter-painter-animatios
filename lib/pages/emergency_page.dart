import 'package:animate_do/animate_do.dart';
import 'package:custom_painter/widgets/fat_button.dart';
import 'package:custom_painter/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.text, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge;

    if (MediaQuery.of(context).size.height > 250) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((e) => FadeInLeft(
              child: FatButton(
                icon: e.icon,
                text: e.text,
                color1: e.color1,
                color2: e.color2,
                onPress: () => print('Hola'),
              ),
            ))
        .toList();

    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: (isLarge) ? 280 : 10),
          child: SafeArea(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: itemMap,
            ),
          ),
        ),
        if (isLarge) _Header(),
      ],
    ));
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.pumpMedical,
          title: 'Asistencia Medica',
          subtitle: 'Haz Solicitado',
          color1: Color(0xff66A9F2),
          color2: Color(0xff536CF6),
        ),
        Positioned(
          right: 0,
          top: 50,
          child: RawMaterialButton(
              padding: EdgeInsets.all(15),
              onPressed: () {},
              shape: CircleBorder(),
              child: FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}

class _FatButtonTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FatButton(
      icon: FontAwesomeIcons.carCrash,
      text: "Crash Cars",
      color1: Color(0xff6989f5),
      color2: Color(0xff9063f5),
      onPress: () => print("fuck you"),
    );
  }
}

class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.briefcaseMedical,
      subtitle: 'Haz Solicitado',
      title: 'Asistencia Medica',
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
    );
  }
}
