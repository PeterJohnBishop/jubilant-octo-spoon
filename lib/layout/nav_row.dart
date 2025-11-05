import 'package:flutter/material.dart';
import 'nav_button.dart';

class NavRow extends StatelessWidget {
  final double height;
  final double width;
  final Function(int) onItemSelected;
  final int currentIndex;

  const NavRow({
    super.key,
    required this.height,
    required this.width,
    required this.onItemSelected,
    required this.currentIndex,
  });

  final List<String> labels = const [
    'home',
    'about',
    'gallery',
    'projects',
    'contact',
  ];

  @override
  Widget build(BuildContext context) {
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
      child: height > width
          ? Column(
              children: [
                const Text(
                  'peter.bishop / software.engineer',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(labels.length, (index) {
                    return NavButton(
                      label: labels[index],
                      isActive: currentIndex == index,
                      onTap: () => onItemSelected(index),
                    );
                  }),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'peter.bishop / software.engineer',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(labels.length, (index) {
                    return NavButton(
                      label: labels[index],
                      isActive: currentIndex == index,
                      onTap: () => onItemSelected(index),
                    );
                  }),
                ),
              ],
            ),
    );
  }
}
