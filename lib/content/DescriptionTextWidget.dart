import 'package:flutter/material.dart';
import 'package:jubilant_octo_spoon/actions/HyperlinkButton.dart';
import 'package:jubilant_octo_spoon/content/globals.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Descriptiontextwidget extends StatelessWidget {
  final DescriptionCardModel data;

  const Descriptiontextwidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        double deskWidth = (width * 0.95).clamp(300, 350);
        double deskHeigh = (height * 0.95).clamp(300, 850);

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              width: deskWidth,
              // height: deskHeigh,
              color: Colors.white,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name, style: const TextStyle(fontSize: 26)),
                    const SizedBox(height: 8),
                    HyperlinkButton(label: data.linkText, url: data.linkUrl),
                    const SizedBox(height: 16),

                    ...data.paragraphs.map(
                      (p) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          p,
                          style: const TextStyle(fontSize: 14, height: 1.4),
                        ),
                      ),
                    ),

                    if (data.logos.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Row(
                        children: data.logos
                            .map(
                              (path) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: SvgPicture.asset(
                                    path,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
