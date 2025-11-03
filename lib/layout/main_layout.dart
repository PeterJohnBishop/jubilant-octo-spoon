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
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _onNavItemSelected(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                VerticalCarousel(
                  width: width,
                  height: height,
                  controller: _pageController,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: NavRow(
                    height: height,
                    width: width,
                    currentIndex: _currentIndex,
                    onItemSelected: _onNavItemSelected,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
