import 'package:flutter/material.dart';

class GalleryCarousel extends StatefulWidget {
  final double height;
  final double width;

  const GalleryCarousel({super.key, required this.height, required this.width});

  @override
  State<GalleryCarousel> createState() => _GalleryCarouselState();
}

class _GalleryCarouselState extends State<GalleryCarousel> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _content = [
    {'title': 'img 1', 'image': 'images/1.jpg'},
    {'title': 'img 2', 'image': 'images/2.jpg'},
    {'title': 'img 3', 'image': 'images/3.jpg'},
    {'title': 'img 4', 'image': 'images/4.jpg'},
    {'title': 'img 5', 'image': 'images/5.jpg'},
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
        scrollDirection: Axis.horizontal,
        itemCount: _content.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;

              if (_pageController.position.haveDimensions) {
                value =
                    ((_pageController.page ??
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
                            image: AssetImage(
                              _content[index]['image'] as String,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              _content[index]['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(blurRadius: 8, color: Colors.black),
                                ],
                              ),
                            ),
                          ),
                        ),
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
