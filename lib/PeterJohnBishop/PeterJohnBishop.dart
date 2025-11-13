import 'package:flutter/material.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/MainDrawer.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/forms/email.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/views/AboutView.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/views/HomeView.dart';
import 'package:jubilant_octo_spoon/PeterJohnBishop/views/ProjectsView.dart';

import 'Footer.dart';
import '../PeterJohnBishop/navTextButton.dart';

class PeterJohnBishop extends StatefulWidget {
  const PeterJohnBishop({super.key});

  @override
  State<PeterJohnBishop> createState() => _PeterJohnBishopState();
}

class _PeterJohnBishopState extends State<PeterJohnBishop> {
  int selectedIndex = 0;
  List<String> pages = ["home", "projects", "about", "blog", "contact"];

  Widget getSelectedPage() {
    switch (selectedIndex) {
      case 0:
        return Center(child: HomeView());
      case 1:
        return ProjectView();
      case 2:
        return AboutView();
      case 3:
        return const Center(child: Text("Blog Page"));
      case 4:
        return EmailForm();
      default:
        return const Center(child: Text("Oops! How'd you get here?!"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final double containerWidth = (width * 0.95).clamp(300, 1200);
        final double containerHeight = (height * 0.95).clamp(350, 1440);
        final bool isWide = width > height;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: width < 600,
            backgroundColor: Colors.white,
            title: const Text('PETER J BISHOP'),
            leading: isWide ? null :
                Builder(
                    builder: (context) {
                      return IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                  ),
            actions: isWide
                ? List.generate(pages.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: NavTextButton(
                        index: index,
                        label: pages[index],
                        isSelected: selectedIndex == index,
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    );
                  })
                : [],
          ),
          drawer: MainDrawer(
            pages: pages,
            onItemSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          body: Stack(
            children: [
              getSelectedPage(),
              isWide ? Align(alignment: Alignment.bottomCenter, child: Footer()) : Container(),
            ],
          ),
        );
      },
    );
  }
}


