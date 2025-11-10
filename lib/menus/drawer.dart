import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileDrawer extends StatefulWidget {
  final Function(int) onItemSelected;
  const MobileDrawer({super.key, required this.onItemSelected});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  late Function(int) onSelected = widget.onItemSelected;

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
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        _launchURL('tel:+17202725223');
                      },
                      icon: Icon(Icons.phone),
                    ),
                    Text('+1 720 272 5223', style: TextStyle(fontSize: 14)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        _launchURL('mailto:peterjbishop.denver@gmail.com');
                      },
                      icon: Icon(Icons.email),
                    ),
                    Text(
                      'peterjbishop.denver@gmail.com',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('home'),
            onTap: () {
              onSelected(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('about'),
            onTap: () {
              onSelected(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('projects'),
            onTap: () {
              onSelected(2);
              Navigator.pop(context);
            },
          ),
          // ListTile(
          //   title: const Text('news'),
          //   onTap: () {
          //     onSelected(3);
          //     Navigator.pop(context);
          //   },
          // ),
          // ListTile(
          //   title: const Text('gallery'),
          //   onTap: () {
          //     onSelected(4);
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            title: const Text('contact'),
            onTap: () {
              onSelected(5);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
