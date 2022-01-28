// import 'package:flutter/material.dart';
// import 'package:flutter_designs/src/models/slider_model.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

// class SlideShowPage extends StatelessWidget {
//   const SlideShowPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => SliderModel(),
//       child: Scaffold(
//         body: Column(
//           children: const [
//             Expanded(child: _Slides()),
//             _DotsIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _DotsIndicator extends StatelessWidget {
//   const _DotsIndicator({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 70,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const <Widget>[
//           _Dot(index: 0),
//           _Dot(index: 1),
//           _Dot(index: 2)
//         ],
//       ),
//     );
//   }
// }

// class _Dot extends StatelessWidget {
//   final int index;
//   const _Dot({
//     Key? key,
//     required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
//     return AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         height: 12,
//         width: 12,
//         margin: const EdgeInsets.symmetric(horizontal: 5),
//         decoration: BoxDecoration(
//           color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
//               ? Colors.blue
//               : Colors.grey,
//           shape: BoxShape.circle,
//         ));
//   }
// }

// class _Slides extends StatefulWidget {
//   const _Slides({Key? key}) : super(key: key);

//   @override
//   State<_Slides> createState() => _SlidesState();
// }

// class _SlidesState extends State<_Slides> {
//   final pageViewController = PageController();

//   @override
//   void initState() {
//     pageViewController.addListener(() {
//       Provider.of<SliderModel>(context, listen: false).currentPage =
//           pageViewController.page!;
//     });

//     super.initState();
//   }

//   @override
//   void dispose() {
//     pageViewController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: pageViewController,
//       children: <Widget>[
//         _SlideContent(svg: 'assets/svgs/slide-1.svg'),
//         _SlideContent(svg: 'assets/svgs/slide-2.svg'),
//         _SlideContent(svg: 'assets/svgs/slide-3.svg'),
//       ],
//     );
//   }
// }

// class _SlideContent extends StatelessWidget {
//   final String svg;

//   const _SlideContent({
//     Key? key,
//     required this.svg,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(30),
//       width: double.infinity,
//       height: double.infinity,
//       child: SvgPicture.asset(svg),
//     );
//   }
// }
