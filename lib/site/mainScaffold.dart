import 'package:flutter/material.dart';
import 'package:jubilant_octo_spoon/site/drawer.dart';

import 'footer.dart';
import 'navTextButton.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int selectedIndex = 0;
  List<String> pages = [
    "home",
    "projects",
    "about",
    "blog",
    "contact",
  ];
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
        return const Center(child: Text("Unknown Page"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('PETER J BISHOP'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          Row(
            children: List.generate(pages.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: navTextButton(
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
            }),
          ),
        ],
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
          Align(alignment: Alignment.bottomCenter, child: footer()),
        ],
      ),
    );
  }
}
