import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jubilant_octo_spoon/globals.dart';

import '../HyperlinkButton.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
                Experience(data: company),
              ],
            ),
          );
        }),
      ),
    ),
  );
  }
}

class Experience extends StatelessWidget {
  final CompanyModel data;

  const Experience({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        double contentWidth = width < 600
            ? width.clamp(600, 1050)
            : width.clamp(300, 350);

        return Center(
          child: Container(
            width: contentWidth,
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SvgPicture.asset(
                        data.logo,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Position and company
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      Text(
                        data.position,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "@${data.name}",
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Hyperlink (removed Flexible)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: HyperlinkButton(
                      label: data.linkText,
                      url: data.linkUrl,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    data.dates,
                    style: const TextStyle(fontSize: 16),
                    softWrap: true,
                  ),

                  const SizedBox(height: 18),

                  // Paragraphs
                  ...data.paragraphs.map(
                    (p) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        p,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(fontSize: 14, height: 1.4),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}