import 'package:flutter/material.dart';

class DesktopAboutTextWidget extends StatelessWidget {
  const DesktopAboutTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        double imageWidth = (width * 0.95).clamp(300, 350);
        double imageHeight = (height * 0.95).clamp(300, 850);

        return Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Center(
            child: Container(
              width: imageWidth,
              height: imageHeight,
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

class MobileAboutTextWidget extends StatelessWidget {
  const MobileAboutTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    double containerWidth = (width * 0.95).clamp(300, 350);

    return Center(
      child: Container(
        width: containerWidth,
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Peter John Bishop', style: TextStyle(fontSize: 26)),
            SizedBox(height: 8),
            Text(
              'A backend-focused software engineer who has evolved from MERN stack development into building full-stack and cross-platform systems using Flutter, SwiftUI, and Go. I design and implement secure, scalable APIs that integrate diverse cloud technologies, including AWS (S3, DynamoDB, Rekognition), Firebase, and Google services. My experience spans containerized deployments with Docker and Kubernetes, authentication frameworks (JWT, OAuth 2.0, TOTP, and SSO), and real-time data processing using modern architectural patterns. I bring a strong foundation in distributed systems, cloud infrastructure, and mobile integration, with a focus on security, performance, and maintainability across platforms.',
            ),
          ],
        ),
      ),
    );
  }
}
