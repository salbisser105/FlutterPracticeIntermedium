import 'package:flutter/material.dart';
import 'package:flutter_designs/src/theme/theme.dart';
import 'package:flutter_designs/src/wigets/slideshow_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Scaffold(
      body: SlideShowWidget(
        primaryBullet: 15,
        secondaryBullet: 12,
        dotsUp: true,
        primaryColor: (appTheme.darkTheme) ? accentColor : Colors.green,
        secondaryColor: Colors.blueGrey,
        slides: <Widget>[
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-4.svg'),
          SvgPicture.asset('assets/svgs/slide-5.svg'),
        ],
      ),
    );
  }
}
