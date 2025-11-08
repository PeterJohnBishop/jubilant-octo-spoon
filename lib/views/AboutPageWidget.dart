import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../content/AboutTextWidget.dart';
import '../visuals/CircularImageWithDropShadowWidget.dart';

class DesktopAboutPageWidget extends StatelessWidget {
  const DesktopAboutPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DesktopCircularImageWithDropShadowWidget(),
                DesktopAboutTextWidget(),
              ],
            );
  }
}

class MobileAboutPageWidget extends StatelessWidget {
  const MobileAboutPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true, // ✅ Ensures list only takes up necessary height
        padding: const EdgeInsets.all(16),
        children: const [
          MobileCircularImageWithDropShadowWidget(),
          SizedBox(height: 16), // ✅ Small consistent space between widgets
          MobileAboutTextWidget(),
        ],
      ),
    );
  }
}