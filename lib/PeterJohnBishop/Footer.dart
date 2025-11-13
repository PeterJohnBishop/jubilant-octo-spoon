import 'package:flutter/material.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/HoverIconButton.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  // Helper function to launch URLs safely
  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  HoverIconButton(
                    icon: Icons.phone,
                    label: '+1 720 272 5223',
                    onPressed: () {
                      _launchURL('tel:+17202725223'); 
                    },
                  ),
                  const SizedBox(width: 20),
                  HoverIconButton(
                    icon: Icons.email,
                    label: 'peterjbishop.denver@gmail.com',
                    onPressed: () {
                      _launchURL('mailto:peterjbishop.denver@gmail.com'); 
                    },
                  ),
                ],
              ),
              const Text(
                "© 2025 Peter Bishop",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
