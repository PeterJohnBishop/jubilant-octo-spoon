import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HyperlinkButton extends StatelessWidget {
  final String text;
  final String url;
  final TextStyle? style;

  const HyperlinkButton({
    Key? key,
    required this.text,
    required this.url,
    this.style,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultStyle = TextStyle(
      color: Colors.blue,
      decoration: TextDecoration.underline,
    );

    return InkWell(
      onTap: _launchUrl,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Text(
        text,
        style: style ?? defaultStyle,
      ),
    );
  }
}