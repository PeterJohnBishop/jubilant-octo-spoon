import 'package:flutter/material.dart';

class MobileImageWithDropShadowWidget extends StatelessWidget {
  final String imagePath;
  const MobileImageWithDropShadowWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        double imageSize = (width * 0.95).clamp(300, 350);

        return Center(
          child: Container(
            width: imageSize,
            height: imageSize, 
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
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover, 
              ),
            ),
          ),
        );
      },
    );
  }
}

class DesktopImageWithDropShadowWidget extends StatelessWidget {
  final String imagePath;
  const DesktopImageWithDropShadowWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        double imageSize = (width * 0.95).clamp(400, 600);

        return Center(
          child: Container(
            width: imageSize,
            height: imageSize, 
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
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover, 
              ),
            ),
          ),
        );
      },
    );
  }
}
