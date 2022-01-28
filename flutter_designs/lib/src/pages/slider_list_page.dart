import 'dart:ui';

import 'package:flutter/material.dart';

class SliderListScreen extends StatelessWidget {
  const SliderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ItemList()
      body: Stack(children: <Widget>[
        const _MainScroll(),
        Positioned(bottom: -10, right: 0, child: _BottonNewList())
      ]),
    );
  }
}

class _BottonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      minWidth: size.width * 0.9,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {},
        color: const Color(0xffED6762),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        child: const Text(
          'CREATE NEW LIST',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
      ),

      // ElevatedButton(
      //   onPressed: (){},
      //   style: ButtonStyle(
      //     backgroundColor: Colors.green,
      //   ),
      //   child: Text('CREATE NEW LIST',
      //   style: TextStyle(
      //     color: Colors.white,
      //     fontSize: 18,
      //     fontWeight: FontWeight.bold,
      //     letterSpacing: 3

      //   ),),
      // )
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
  }) : super(key: key);

  final items = const [
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => items[index]);
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: const Text('New',
              style: TextStyle(color: Color(0xff532128), fontSize: 35)),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 2,
              child: Container(
                  width: 150, height: 8, color: const Color(0xffF7CDD5)),
            ),
            const Text(
              'List',
              style: TextStyle(color: Color(0xffD93A30), fontSize: 40),
            )
          ],
        )
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      height: 100,
      margin: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({Key? key}) : super(key: key);

  final items = const [
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // const SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola mundo'),
        // ),
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minheight: 200, maxheight: 250, child: const _Title())),
        SliverList(
            delegate: SliverChildListDelegate.fixed(
                [...items, const SizedBox(height: 100)])),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverCustomHeaderDelegate(
      {required this.child, required this.minheight, required this.maxheight});

  final double minheight;
  final double maxheight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => (minheight > maxheight) ? minheight : maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxExtent ||
        minheight != oldDelegate.minExtent;
  }
}
