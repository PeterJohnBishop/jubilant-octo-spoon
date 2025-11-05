import 'package:flutter/material.dart';

class ProjectsView extends StatefulWidget {
  final double height;
  final double width;
  const ProjectsView({super.key, required this.height, required this.width});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  @override
  Widget build(BuildContext context) {
    final height = widget.height;
    final width = widget.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
            ),
            SizedBox(
              width: height > width ? width * 0.8 : width * 0.4,
              height: height > width ? height * 0.3 : height * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('images/api_response.gif'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 24,
            ),
            SizedBox(
              width: height > width ? width * 0.8 : width * 0.4,
              height: height > width ? height * 0.3 : height * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('images/nightclub.gif'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 24,
            ),
            SizedBox(
              width: height > width ? width * 0.8 : width * 0.4,
              height: height > width ? height * 0.3 : height * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('images/weather.gif'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 24,
            ),
            SizedBox(
              width: height > width ? width * 0.8 : width * 0.4,
              height: height > width ? height * 0.3 : height * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('images/combo.gif'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
