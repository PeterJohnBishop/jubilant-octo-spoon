import 'package:flutter/material.dart';
import 'package:jubilant_octo_spoon/layout/nav_row.dart';
import 'package:jubilant_octo_spoon/layout/vertical_carousel.dart';

class MainLayout extends StatefulWidget {
  final double height;
  final double width;

  const MainLayout({super.key, required this.height, required this.width});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    var height = widget.height;
    var width = widget.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                VerticalCarousel(width: width, height: height,),
                Positioned(
                  top: 0, // sticks to the top
                  left: 0,
                  right: 0,
                  child: NavRow(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
