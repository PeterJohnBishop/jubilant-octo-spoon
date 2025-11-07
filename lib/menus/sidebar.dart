import 'package:flutter/material.dart';
import 'package:jubilant_octo_spoon/actions/hover-icon.dart';

class MinimalSidebarWidget extends StatefulWidget {
  const MinimalSidebarWidget({super.key});

  @override
  State<MinimalSidebarWidget> createState() => _MinimalSidebarWidgetState();
}

class _MinimalSidebarWidgetState extends State<MinimalSidebarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        HoverIconButton(icon: Icons.phone, label: '+1 720 272 5223', onPressed: () {}),
        const SizedBox(height: 20),
        HoverIconButton(icon: Icons.email, label: 'peterjbishop.denver@gmail.com', onPressed: () {}),
      ],
    );
  }
}
