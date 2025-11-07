import 'package:flutter/material.dart';

class CircularImageWithDropShadowWidget extends StatelessWidget {
  const CircularImageWithDropShadowWidget({super.key});

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
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  offset: const Offset(0, 6),
                  blurRadius: 10,
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset('images/me.png', fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}

class MobileCircularImageWithDropShadowWidget extends StatelessWidget {
  const MobileCircularImageWithDropShadowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        double imageWidth = (width * 0.95).clamp(200, 350);
        double imageHeight = (height * 0.95).clamp(200, 350);

        return Padding(padding: EdgeInsetsGeometry.all(8), child: Container(
            width: imageWidth,
            height: imageHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  offset: const Offset(0, 6),
                  blurRadius: 10,
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset('images/me.png', fit: BoxFit.cover),
        ),
        );
      },
    );
  }
}
