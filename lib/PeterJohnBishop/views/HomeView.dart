import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final bool isWide = width > height;
        return isWide
            ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [HomeImage(), HomeText()])
            : SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [HomeImage(), HomeText()]),
            );
      },
    );
  }
}

class HomeText extends StatelessWidget {
  const HomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
       final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final bool isWide = width > height;
        double contentWidth = (width * 0.95).clamp(300, 350);

        return Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Center(
            child: Container(
              width: contentWidth,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Peter John Bishop', style: TextStyle(fontSize: 26)),
                  SizedBox(width: 8),
                  Text(
                    'A backend-focused software engineer who has evolved from MERN stack development into building full-stack and cross-platform systems using Flutter, SwiftUI, and Go. I design and implement secure, scalable APIs that integrate diverse cloud technologies, including AWS (S3, DynamoDB, Rekognition), Firebase, and Google services. My experience spans containerized deployments with Docker and Kubernetes, authentication frameworks (JWT, OAuth 2.0, TOTP, and SSO), and real-time data processing using modern architectural patterns. I bring a strong foundation in distributed systems, cloud infrastructure, and mobile integration, with a focus on security, performance, and maintainability across platforms.',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class HomeImage extends StatelessWidget {
  const HomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final bool isWide = width > height;
        double imageWidth = (width * 0.95).clamp(300, 850);

        return Center(
          child: Container(
            width: imageWidth,
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
