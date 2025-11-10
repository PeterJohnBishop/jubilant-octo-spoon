import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jubilant_octo_spoon/content/HomeTextWidget.dart';
import 'package:jubilant_octo_spoon/content/ProjectTextWidget.dart';
import 'package:jubilant_octo_spoon/content/ProjectCarousel.dart';
import 'package:jubilant_octo_spoon/forms/email.dart';
import 'package:jubilant_octo_spoon/visuals/CircularImageWithDropShadowWidget.dart';

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

class GlobalData {

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

  static Widget desktopAbout = Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("About Page Under Construction")
      ],
    ),
  );

  static Widget mobileAbout = Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text("About Page Under Construction")
      ],
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
