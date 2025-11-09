import 'package:flutter/material.dart';
import 'package:jubilant_octo_spoon/actions/nav-text.dart';
import 'package:jubilant_octo_spoon/content/AboutTextWidget.dart';
import 'package:jubilant_octo_spoon/content/DescriptionTextWidget.dart';
import 'package:jubilant_octo_spoon/content/VerticalCarouselWidget.dart';
import 'package:jubilant_octo_spoon/content/globals.dart';
import 'package:jubilant_octo_spoon/menus/drawer.dart';
import 'package:jubilant_octo_spoon/menus/sidebar.dart';
import 'package:jubilant_octo_spoon/views/AboutPageWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    if (size.width < 1300) {
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
        ),
        drawer: MobileDrawer(),
        body: Stack(
          children: [
            // MobileAboutPageWidget()
            Center(child: VerticalCarousel(images: GlobalData.assetImages)),
          ],
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('PETER J BISHOP'),
          actions: [
            NavTextButton(
              index: 0,
              label: 'home',
              isSelected: selectedIndex == 0 ? true : false,
              onPressed: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            SizedBox(width: 20),
            NavTextButton(
              index: 1,
              label: 'about',
              isSelected: selectedIndex == 1 ? true : false,
              onPressed: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
            SizedBox(width: 20),
            NavTextButton(
              index: 2,
              label: 'projects',
              isSelected: selectedIndex == 2 ? true : false,
              onPressed: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
            SizedBox(width: 20),
            NavTextButton(
              index: 3,
              label: 'news',
              isSelected: selectedIndex == 3 ? true : false,
              onPressed: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
            ),
            SizedBox(width: 20),
            NavTextButton(
              index: 4,
              label: 'gallery',
              isSelected: selectedIndex == 4 ? true : false,
              onPressed: () {
                setState(() {
                  selectedIndex = 4;
                });
              },
            ),
            SizedBox(width: 20),
            NavTextButton(
              index: 5,
              label: 'contact',
              isSelected: selectedIndex == 5 ? true : false,
              onPressed: () {
                setState(() {
                  selectedIndex = 5;
                });
              },
            ),
            SizedBox(width: 20),
          ],
        ),
        body: Stack(
          children: [
            switch (selectedIndex) {
              0 => GlobalData.desktopHome,
              1 => GlobalData.desktopAbout,
              2 => GlobalData.desktopProjects,
              3 => GlobalData.desktopNews,
              4 => GlobalData.desktopGallery,
              5 => GlobalData.desktopContact,
              _ => GlobalData.desktopHome,
            },

            MinimalSidebarWidget(),
          ],
        ),
      );
    }
  }
}
