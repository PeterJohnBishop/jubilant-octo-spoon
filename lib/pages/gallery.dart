import 'package:flutter/material.dart';

class GalleryCarousel extends StatefulWidget {
  const GalleryCarousel({super.key});

  @override
  State<GalleryCarousel> createState() => _GalleryCarouselState();
}

class _GalleryCarouselState extends State<GalleryCarousel> {
  late final PageController _pageController;
  int _currentIndex = 0;

  final List<Map<String, String>> _content = [
    {
      'title': 'Mountain Escape',
      'description': 'A peaceful mountain view at sunrise.',
      'image': 'images/combo.gif',
    },
    {
      'title': 'City Lights',
      'description': 'The skyline at night from above the city.',
      'image': 'images/2.jpg',
    },
    {
      'title': 'Ocean Waves',
      'description': 'Calm turquoise waters meeting the horizon.',
      'image': 'images/3.jpg',
    },
    {
      'title': 'Desert Dunes',
      'description': 'Wind-carved dunes under a warm sunset.',
      'image': 'images/4.jpg',
    },
    {
      'title': 'Forest Trail',
      'description': 'A quiet walk through lush green woods.',
      'image': 'images/5.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  void _nextCard() {
    if (_currentIndex < _content.length - 1) {
      _currentIndex++;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }

  void _previousCard() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;

        return PageView.builder(
          controller: _pageController,
          itemCount: _content.length,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                double value = 1.0;
                if (_pageController.position.haveDimensions) {
                  value =
                      (_pageController.page ?? _currentIndex.toDouble()) -
                      index;
                  value = (1 - (value.abs() * 0.2)).clamp(0.8, 1.0);
                }

                return Center(
                  child: Transform.scale(
                    scale: value,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: width > height ? 16 : 2,
                        vertical: 20,
                      ),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: const Offset(0, 6),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Title
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 12),
                            child: Text(
                              _content[index]['title'] ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          LayoutBuilder(
                            builder: (context, innerConstraints) {
                              double imageWidth = (width * 0.6).clamp(200, 900);
                              double imageHeight = (height * 0.5).clamp(
                                200,
                                900,
                              );

                              return Container(
                                width: imageWidth,
                                height: imageHeight,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(0, 6),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    _content[index]['image']!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_currentIndex > 0)
                                IconButton(
                                  icon: const Icon(
                                    Icons.chevron_left,
                                    size: 48,
                                    color: Colors.black54,
                                  ),
                                  onPressed: _previousCard,
                                  splashRadius: 30,
                                ),
                              SizedBox(width: 20),
                              if (_currentIndex < _content.length - 1)
                                IconButton(
                                  icon: const Icon(
                                    Icons.chevron_right,
                                    size: 48,
                                    color: Colors.black54,
                                  ),
                                  onPressed: _nextCard,
                                  splashRadius: 30,
                                ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              _content[index]['description'] ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
