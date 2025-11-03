import 'package:flutter/material.dart';

import 'nav_button.dart';

class NavRow extends StatefulWidget {
  final double height;
  final double width;
  const NavRow({super.key,
    required this.height,
    required this.width,
  });

  @override
  State<NavRow> createState() => _NavRowState();
}

class _NavRowState extends State<NavRow> {
  int _activeIndex = 0;

  final List<String> labels = [
    'home',
    'about',
    'projects',
    'gallery',
    'contact',
  ];

  @override
  Widget build(BuildContext context) {
     final height = widget.height;
    final width = widget.width;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: height > width ?
      Column(
        children: [
          Text( 'peter.bishop / software.engineer',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w100,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(labels.length, (index) {
              return NavButton(
                label: labels[index],
                isActive: _activeIndex == index,
                onTap: () => setState(() => _activeIndex = index),
              );
            }),
          ),
        ],
      )
      : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text( 'peter.bishop / software.engineer',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w100,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(labels.length, (index) {
              return NavButton(
                label: labels[index],
                isActive: _activeIndex == index,
                onTap: () => setState(() => _activeIndex = index),
              );
            }),
          ),
        ],)
    );
  }
}