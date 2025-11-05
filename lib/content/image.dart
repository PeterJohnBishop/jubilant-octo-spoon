import 'package:flutter/material.dart';

class MobileImageWithDropShadowWidget extends StatelessWidget {
  const MobileImageWithDropShadowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        double imageWidth = (width * 0.95).clamp(300, 850);
        double imageHeight = (height * 0.95).clamp(300, 850);

        return Center(
          child: Container(
            width: imageWidth,
            height: imageHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  offset: const Offset(0, 6),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('images/1.jpg', fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}

class DesktopImageWithDropShadowWidget extends StatelessWidget {
  const DesktopImageWithDropShadowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        double imageWidth = (width * 0.95).clamp(1200, 1920);
        double imageHeight = (height * 0.95).clamp(600, 1080);

        return Center(
          child: Container(
            width: imageWidth,
            height: imageHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  offset: const Offset(0, 6),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('images/2.jpg', fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}
