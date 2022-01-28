import 'package:flutter/material.dart';

import 'package:flutter_designs/src/pages/launcher_page.dart';
import 'package:flutter_designs/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
      create: (_) => ThemeChanger(0),
      child: const MyApp()
));


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      title: 'Designs App',
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      // home: const TryHard(),
      home: const LauncherScreen(),
    );
  }
}

class TryHard extends StatelessWidget {
  const TryHard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hello world ')
    );
  }
}
