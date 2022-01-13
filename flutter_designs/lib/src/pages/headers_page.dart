import 'package:flutter/material.dart';
import 'package:flutter_designs/src/wigets/headers_widget.dart';


class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HeaderWaveGradient()
    );
  }
}