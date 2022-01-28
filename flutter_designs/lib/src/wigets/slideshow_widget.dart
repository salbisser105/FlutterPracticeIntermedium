import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShowWidget extends StatelessWidget {
  const SlideShowWidget({
    Key? key,
    required this.slides,
    this.dotsUp = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 12.0,
    this.secondaryBullet = 12.0,
  }) : super(key: key);

  final List<Widget> slides;
  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideShowModel(),
      child: SafeArea(child: Builder(builder: (BuildContext context) {
        Provider.of<_SlideShowModel>(context)._primaryColor = primaryColor;
        Provider.of<_SlideShowModel>(context).secondaryColor = secondaryColor;
        Provider.of<_SlideShowModel>(context)._primaryBullet = primaryBullet;
        Provider.of<_SlideShowModel>(context)._secondaryBullet =
            secondaryBullet;

        return _createSlideShowColumn(
            dotsUp: dotsUp,
            slides: slides,
            primaryColor: primaryColor,
            secondaryColor: secondaryColor);
      })),
    );
  }
}

class _createSlideShowColumn extends StatelessWidget {
  const _createSlideShowColumn({
    Key? key,
    required this.dotsUp,
    required this.slides,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  final bool dotsUp;
  final List<Widget> slides;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (dotsUp)
          _DotsIndicator(
              totalSlides: slides.length,
              primaryColor: primaryColor,
              secondaryColor: secondaryColor),
        Expanded(child: _Slides(slides: slides)),
        if (!dotsUp)
          _DotsIndicator(
              totalSlides: slides.length,
              primaryColor: primaryColor,
              secondaryColor: secondaryColor),
      ],
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  const _DotsIndicator(
      {Key? key,
      required this.totalSlides,
      this.primaryColor,
      this.secondaryColor})
      : super(key: key);

  final int totalSlides;
  final Color? primaryColor;
  final Color? secondaryColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            totalSlides,
            (index) => _Dot(
                  index: index,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slideShowModel = Provider.of<_SlideShowModel>(context);

    double size = 0;
    Color color;
    if (slideShowModel.currentPage >= index - 0.5 &&
        slideShowModel.currentPage < index + 0.5) {
      size = slideShowModel._primaryBullet;
      color = slideShowModel._primaryColor;
    } else {
      size = slideShowModel._secondaryBullet;
      color = slideShowModel.secondaryColor;
    }

    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: size,
        width: size,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ));
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key? key, required this.slides}) : super(key: key);

  final List<Widget> slides;

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideShowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children:
          widget.slides.map((slide) => _SlideContent(slide: slide)).toList(),
    );
  }
}

class _SlideContent extends StatelessWidget {
  final Widget slide;

  const _SlideContent({
    Key? key,
    required this.slide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      height: double.infinity,
      child: slide,
    );
  }
}

class _SlideShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12.0;
  double _secondaryBullet = 12.0;

  double get primaryBullet => _primaryBullet;
  set primaryBullet(double value) {
    _primaryBullet = value;
  }

  double get secondaryBullet => _secondaryBullet;
  set secondaryBullet(double value) {
    _secondaryBullet = value;
  }

  double get currentPage => _currentPage;

  Color get primaryColor => _primaryColor;
  set primaryColor(Color color) {
    _primaryColor = color;
  }

  Color get secondaryColor => _secondaryColor;
  // ignore: unnecessary_getters_setters
  set secondaryColor(Color color) {
    _secondaryColor = color;
  }

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}
