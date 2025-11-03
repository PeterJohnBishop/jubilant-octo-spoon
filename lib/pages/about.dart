import 'package:flutter/material.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.person, color: Colors.white,),
        SizedBox(width: 8),
        Text('About Page Under Construction', style: TextStyle(
          color: Colors.white
        ),),
      ],
    );
  }
}