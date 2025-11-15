import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/HomeTextWidget.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/ProjectTextWidget.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/ProjectCarousel.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/forms/email.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/CircularImageWithDropShadowWidget.dart';

class ProjectCardModel {
  final String name;
  final String linkText;
  final String linkUrl;
  final List<String> paragraphs;
  final List<String> imageAssets;
  final List<String> logos;

  const ProjectCardModel({
    required this.name,
    required this.linkText,
    required this.linkUrl,
    required this.paragraphs,
    required this.imageAssets,
    required this.logos,
  });
}

class CompanyModel {
  final String name;
  final String dates;
  final String position;
  final String logo;
  final String linkText;
  final String linkUrl;
  final List<String> paragraphs;

  const CompanyModel({
    required this.name,
    required this.dates,
    required this.position,
    required this.logo,
    required this.linkText,
    required this.linkUrl,
    required this.paragraphs
  });
}

class GlobalData {

  static List<CompanyModel> companyDescriptions = [
    CompanyModel(name: "ClickUp", dates: "May 2025 - Present", position: "Senior Technical Support Specialist", logo: "images/logo-v3-clickup-light.svg", linkText: "https://clickup.com/", linkUrl: "https://clickup.com/", paragraphs: [
      "- Designed troubleshooting workflows for OAuth 2.0, SSO, and Git integrations.",
      "- Assist client engineers on backend performance optimization and authentication setups.",
      "- Partnered with enterprise clients to debug high-complexity API-driven workflows and custom integration issues.",
      "- AI Agent prompt engineering to ensure effective and efficient communication with the internal MCP server."
    ]),
    CompanyModel(name: "ClickUp", dates: "April 2024 - Present", position: "App Data & Visualization SME", logo: "images/logo-v3-clickup-light.svg", linkText: "https://clickup.com/", linkUrl: "https://clickup.com/", paragraphs: [
      "- Subject matter expert for the mobile & desktop apps, Whiteboards, and Dashboards.",
      "- Contributed code to Flutter application backend logic.",
      "- Debugged API request flows using Sentry, Amplitude, and DataDog telemetry.",
      "- Collaborated with backend engineers to ensure clients adhered to API specs.",
    ]),
    CompanyModel(name: "ClickUp", dates: "January 2023 - Present", position: "API SME", logo: "images/logo-v3-clickup-light.svg", linkText: "https://clickup.com/", linkUrl: "https://clickup.com/", paragraphs: [
      "- Co-developed a full-stack Chrome extension leveraging private API data for client workflow analysis and data collection.",
      "- Partnered with clients to implement OAuth 2.0, JWT authentication, and API integrations (GitHub, Zapier, Make).",
      "- Debugged API request flows using Sentry, Amplitude, and DataDog telemetry.",
      "- Updated and validated public OpenAPI documentation to align with backend changes.",
    ]),
    CompanyModel(name: "ClickUp", dates: "June 2022 - April 2024", position: "Technical Support Specialist", logo: "images/logo-v3-clickup-light.svg", linkText: "https://clickup.com/", linkUrl: "https://clickup.com/", paragraphs: [
      "- Investigated backend and frontend issues across multiple platforms and assisted with defect triage.",
      "- Supported client implementations of API-driven workflows and cloud integrations.",
      "- Advocate for client feature requests and defect resolution, working as a liaison between clients and our development teams to keep bug reports actionable and updated.",
    ])
  ];

  static List<ProjectCardModel> projectDescriptions = [
    ProjectCardModel(
      name: "TOTP Authentication App",
      linkText: "GitHub",
      linkUrl: "https://github.com/PeterJohnBishop/QR-TOTP-Swiftui",
      paragraphs: [
        "VisionKit QR code scanner to extract the issuer, username, and secret from the image.",
        "On scan the user is automatically redirected to the main screen and the passcode is displayed.",
        "Once scanned the user can save this and regenerate the updated code anytime from the list. The secret and timeinterval are saved through SwiftData.",
      ],
      imageAssets: ["TOTP/QRTOTP.gif"],
      logos: ["images/swift-original-wordmark.svg"],
    ),
    ProjectCardModel(
      name: "API TUI",
      linkText: "GitHub",
      linkUrl: "https://github.com/PeterJohnBishop/tui-api",
      paragraphs: [
        "A TUI built with Go and BubbleTea framework.",
        "Using Elm architecture design pattern to implement an API request testing terminal based application with a reactive user interface.",
        "Select a method, apply one or more headers, and request body as needed. Verify the response in a scrollable frame.",
      ],
      imageAssets: ["APICLI/apicli.jpeg"],
      logos: ["images/go-logo-blue.svg"],
    ),
    ProjectCardModel(
      name: "Facial Rekognition",
      linkText: "GitHub",
      linkUrl: "https://github.com/PeterJohnBishop/FacialRekognition-SwfitUI",
      paragraphs: [
        "A demonstration using AWS Rekognition to compare a stored image against an image taken at the moment for a basic biometric authenticaion.",
        "- Register a new user account through Firebase Authentication.",
        "- Submit a base image for comparison, stored in AWS S3.",
        "- After passing basic auth, take a fresh image for comparison to the base via AWS Rekgnition's integration with S3.",
        "- Currently configured to consider a 90% match authenticated."
            "- App implemented as a mobile app using SwiftUI connecting through a Heroku hosted server.",
      ],
      imageAssets: [
        "Rekognition/RegisterDemo.gif",
        "Rekognition/faceComparison.gif",
      ],
      logos: [
        "images/swift-original-wordmark.svg",
        "images/amazonwebservices-original-wordmark.svg",
        "images/firebase-plain-wordmark.svg",
      ],
    ),
  ];

  static Widget desktopHome = Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DesktopCircularImageWithDropShadowWidget(),
        DesktopHomeTextWidget(),
      ],
    ),
  );

  static Widget mobileHome = Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MobileCircularImageWithDropShadowWidget(),
        MobileHomeTextWidget(),
      ],
    ),
  );

  static Widget About = Center(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(GlobalData.companyDescriptions.length, (index) {
          final company = GlobalData.companyDescriptions[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ],
            ),
          );
        }),
      ),
    ),
  );

  static Widget desktopProjects = Center(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(GlobalData.projectDescriptions.length, (index) {
          final project = GlobalData.projectDescriptions[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                ProjectCarousel(images: project.imageAssets),
                const SizedBox(width: 40),
                Projecttextwidget(data: project),
              ],
            ),
          );
        }),
      ),
    ),
  );

  static Widget mobileProjects = Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(GlobalData.projectDescriptions.length, (index) {
          final project = GlobalData.projectDescriptions[index];
          return Column(
              children: [
                ProjectCarousel(images: project.imageAssets),
                const SizedBox(width: 20),
                Projecttextwidget(data: project),
              ],
            
          );
        }
      ),
    ),
  ),
  );

  static Widget desktopBlog = Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Blog Under Construction")],
    ),
  );

  static Widget mobileBlog = Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Blog Under Construction")],
    ),
  );

  static Widget Contact = LayoutBuilder(
  builder: (context, constraints) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 1600,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Contact Me", style: TextStyle(
              fontSize: 24
            ),),
            EmailForm()
          ],
        )
      ),
    );
  },
);

}
