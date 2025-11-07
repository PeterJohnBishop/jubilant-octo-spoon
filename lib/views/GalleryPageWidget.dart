import 'package:flutter/material.dart';
import '../visuals/ImageWithDropShadowWidget.dart';

class GalleryPageWidget extends StatelessWidget {
  final List<String> imagePaths;
  const GalleryPageWidget({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final isMobile = width < 1300;

    double constrainedWidth = (width * 0.95).clamp(1200, 1920);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isMobile ? width * 0.95 : constrainedWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: isMobile
              ? _buildMobileList()
              : _buildDesktopGrid(), 
        ),
      ),
    );
  }

  Widget _buildMobileList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imagePaths.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return MobileImageWithDropShadowWidget(imagePath: imagePaths[index]);
      },
    );
  }

  Widget _buildDesktopGrid() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: false, 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 1, 
      ),
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return DesktopImageWithDropShadowWidget(imagePath: imagePaths[index]);
      },
    );
  }
}
