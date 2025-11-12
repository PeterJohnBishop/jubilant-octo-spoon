import 'package:flutter/material.dart';
import 'package:jubilant_octo_spoon/site/MainDrawer.dart';

import 'Footer.dart';
import 'navTextButton.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int selectedIndex = 0;
  List<String> pages = ["home", "projects", "about", "blog", "contact"];

  Widget getSelectedPage() {
    switch (selectedIndex) {
      case 0:
        return const Center(child: Text("Home Page"));
      case 1:
        return const Center(child: Text("Projects Page"));
      case 2:
        return const Center(child: Text("About Page"));
      case 3:
        return const Center(child: Text("Blog Page"));
      case 4:
        return const Center(child: Text("Contact Page"));
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

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: containerWidth < 600,
            backgroundColor: Colors.white,
            title: const Text('PETER J BISHOP'),
            leading: containerWidth < 600
                ? Builder(
                    builder: (context) {
                      return IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                  )
                : null,
            actions: containerWidth > 600
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
              containerWidth < 600 ? Container() : Align(alignment: Alignment.bottomCenter, child: Footer()),
            ],
          ),
        );
      },
    );
  }
}