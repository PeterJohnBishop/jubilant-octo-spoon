import 'package:flutter/material.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/ProjectCarousel.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/ProjectTextWidget.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/globals.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({super.key});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;
        final bool isWide = width > height;

        return SingleChildScrollView(
          scrollDirection: isWide ? Axis.horizontal : Axis.vertical,
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: GlobalData.projectDescriptions.map((project) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ProjectCarousel(images: project.imageAssets),
                          const SizedBox(height: 16),
                          Projecttextwidget(data: project),
                        ],
                      ),
                    );
                  }).toList(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: GlobalData.projectDescriptions.map((project) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          ProjectCarousel(images: project.imageAssets),
                          const SizedBox(height: 16),
                          Projecttextwidget(data: project),
                        ],
                      ),
                    );
                  }).toList(),
                ),
        );
      },
    );
  }
}
