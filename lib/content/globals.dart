import 'package:flutter/widgets.dart';
import 'package:jubilant_octo_spoon/content/AboutTextWidget.dart';
import 'package:jubilant_octo_spoon/content/DescriptionTextWidget.dart';
import 'package:jubilant_octo_spoon/content/VerticalCarouselWidget.dart';
import 'package:jubilant_octo_spoon/visuals/CircularImageWithDropShadowWidget.dart';

class DescriptionCardModel {
  final String name;
  final String linkText;
  final String linkUrl;
  final List<String> paragraphs;
  final List<String> imageAssets;
  final List<String> logos;

  const DescriptionCardModel({
    required this.name,
    required this.linkText,
    required this.linkUrl,
    required this.paragraphs,
    required this.imageAssets,
    required this.logos,
  });
}

class GlobalData {
  static List<String> assetImages = ["images/apiResp.gif", "images/combo.gif"];

  static List<DescriptionCardModel> projectDescriptions = [
    DescriptionCardModel(
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
      children: [Text("Home Page Under Construction")],
    ),
  );

    static Widget mobileHome = Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Home Page Under Construction")],
    ),
  );

  static Widget desktopAbout = Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DesktopCircularImageWithDropShadowWidget(),
        DesktopAboutTextWidget(),
      ],
    ),
  );

    static Widget mobileAbout = Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MobileCircularImageWithDropShadowWidget(),
        MobileAboutTextWidget(),
      ],
    ),
  );

  static Widget desktopProjects = Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VerticalCarousel(images: GlobalData.projectDescriptions[0].imageAssets),
        Descriptiontextwidget(data: GlobalData.projectDescriptions[0]),
      ],
    ),
  );

    static Widget mobileProjects = Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VerticalCarousel(images: GlobalData.projectDescriptions[0].imageAssets),
        Descriptiontextwidget(data: GlobalData.projectDescriptions[0]),
      ],
    ),
  );

  static Widget desktopNews = Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("News Page Under Construction")],
    ),
  );

static Widget mobileNews = Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("News Page Under Construction")],
    ),
  );

  static Widget desktopGallery = Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Gallery Under Construction")],
    ),
  );

  static Widget mobileGallery = Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Gallery Under Construction")],
    ),
  );

  static Widget desktopContact = Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Contact Page Under Construction")],
    ),
  );

    static Widget mobileContact = Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Contact Page Under Construction")],
    ),
  );
}
