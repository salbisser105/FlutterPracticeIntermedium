import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// class NavigationScreen extends StatelessWidget {
//   const NavigationScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => _NotificationModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.green,
//           title: const Text('Notifications Page'),
//         ),
//         floatingActionButton: FloatingButton(),
//         bottomNavigationBar: BottomNavigation(),
//         body: const Center(
//           child: Text('NavigationScreen'),
//         ),
//       ),
//     );
//   }
// }

// class BottomNavigation extends StatelessWidget {
//   const BottomNavigation({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final int numero = Provider.of<_NotificationModel>(context).number;
//     return BottomNavigationBar(
//       currentIndex: 0,
//       selectedItemColor: Colors.green,
//       items: const [
//         //You can do Stack inside those Icons, for adding more stuff
//         BottomNavigationBarItem(
//             label: 'Bones', icon: Icon(FontAwesomeIcons.bone)),
//         BottomNavigationBarItem(
//             label: 'Notifications', icon: Icon(FontAwesomeIcons.bell)),
//         BottomNavigationBarItem(
//             label: 'My Dog', icon: Icon(FontAwesomeIcons.dog))
//       ],
//     );
//   }
// }

// class FloatingButton extends StatelessWidget {
//   const FloatingButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//         child: const Icon(FontAwesomeIcons.play),
//         onPressed: () {
//           int numero =
//               Provider.of<_NotificationModel>(context, listen: false).number;
//           numero++;
//           Provider.of<_NotificationModel>(context, listen: false).number =
//               numero;
//         });
//   }
// }

// class _NotificationModel extends ChangeNotifier {
//   int _number = 0;
//   int get number => _number;

//   set number(int value) {
//     _number = value;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:animate_do/animate_do.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('Notifications Page'),
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        const BottomNavigationBarItem(
            label: 'Bones', icon: FaIcon(FontAwesomeIcons.bone)),
        BottomNavigationBarItem(
            label: 'Notifications',
            icon: Stack(
              children: <Widget>[
                const FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  // child: Icon( Icons.brightness_1, size: 8, color: Colors.redAccent, )
                  child: BounceInDown(
                    from: 10,
                    animate: (numero > 0) ? true : false,
                    child: Bounce(
                      from: 10,
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context,listen: false)
                              .bounceController = controller,
                      child: Container(
                        child: Text(
                          '$numero',
                          style:
                              const TextStyle(color: Colors.white, fontSize: 7),
                        ),
                        alignment: Alignment.center,
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent, shape: BoxShape.circle),
                      ),
                    ),
                  ),
                )
              ],
            )),
        const BottomNavigationBarItem(
            label: 'My Dog', icon: FaIcon(FontAwesomeIcons.dog)),
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const FaIcon(FontAwesomeIcons.play),
        backgroundColor: Colors.pink,
        onPressed: () {
          final notiModel =
              Provider.of<_NotificationModel>(context, listen: false);

          int numero = notiModel.numero;
          numero++;

          notiModel.numero = numero;

          if (numero >= 2) {
            final controller = notiModel.bounceController;
            controller.forward(from: 0.0);
          }
        });
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController _bounceController;

  int get numero => _numero;

  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController;
  set bounceController(AnimationController controller) {
    _bounceController = controller;
  }
}
