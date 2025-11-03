import 'package:flutter/material.dart';
import '../pages/about.dart';
import '../pages/contact.dart';
import '../pages/gallery.dart';
import '../pages/home.dart';
import '../pages/projects.dart';

class VerticalCarousel extends StatefulWidget {
  final double height;
  final double width;
  final PageController controller;

  const VerticalCarousel({
    super.key,
    required this.height,
    required this.width,
    required this.controller,
  });

  @override
  State<VerticalCarousel> createState() => _VerticalCarouselState();
}

class _VerticalCarouselState extends State<VerticalCarousel> {
  late final PageController _pageController;

  final List<Map<String, String>> _content = [
    {'title': 'Page 1', 'image': 'images/1.jpg'},
    {'title': 'Page 2', 'image': 'images/2.jpg'},
    {'title': 'Page 3', 'image': 'images/3.jpg'},
    {'title': 'Page 4', 'image': 'images/4.jpg'},
    {'title': 'Page 5', 'image': 'images/5.jpg'},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    final height = widget.height;
    final width = widget.width;

    return SizedBox(
      width: width,
      height: height,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: _content.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;

              if (_pageController.position.haveDimensions) {
                value = ((_pageController.page ??
                            _pageController.initialPage.toDouble()) -
                        index)
                    .toDouble();
                value = (1 - (value.abs() * 0.8)).clamp(0.0, 1.0).toDouble();
              }

              return Padding(
                padding: const EdgeInsets.all(20),
                child: Opacity(
                  opacity: value,
                  child: Transform.scale(
                    scale: 0.95 + (value * 0.05),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(0, 4),
                              blurRadius: 10,
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(_content[index]['image'] as String),
                            fit: height > width
                                ? BoxFit.fitHeight
                                : BoxFit.fitWidth,
                          ),
                        ),
                        child: _getPage(index),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

Widget _getPage(int index) {
  switch (index) {
    case 0:
      return HomeView();
    case 1:
      return AboutView();
    case 2:
      return GalleryView();
    case 3:
      return ProjectsView();
    case 4:
      return ContactView();
    default:
      return HomeView();
  }
}
