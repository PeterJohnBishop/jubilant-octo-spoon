import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../content/about.dart';
import '../visuals/CircularImageWithDropShadowWidget.dart';

class DesktopAboutPageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularImageWithDropShadowWidget(),
                AboutTextWidget(),
              ],
            );
  }
}

class MobileAboutPageWidget extends StatelessWidget {
  const MobileAboutPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: ListView(
              children: [
                MobileCircularImageWithDropShadowWidget(),
                MobileAboutTextWidget(),
              ],
            ),
    );
  }
}