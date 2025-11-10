import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HyperlinkButton extends StatefulWidget {
  final String label;
  final String url;

  const HyperlinkButton({
    super.key,
    required this.label,
    required this.url,
  });

  @override
  State<HyperlinkButton> createState() => _HyperlinkButtonState();
}

class _HyperlinkButtonState extends State<HyperlinkButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  Color get _textColor {
    if (_isPressed || _isHovered) {
      return Colors.black;
    }
    return Colors.grey[600]!;
  }

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $widget.url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          _launchUrl();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: TextStyle(
            color: _textColor,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}