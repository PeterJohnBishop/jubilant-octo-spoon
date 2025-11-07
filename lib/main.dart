import 'package:flutter/material.dart';
import 'package:jubilant_octo_spoon/actions/nav-text.dart';
import 'package:jubilant_octo_spoon/content/about.dart';
import 'package:jubilant_octo_spoon/menus/drawer.dart';
import 'package:jubilant_octo_spoon/menus/sidebar.dart';
import 'package:jubilant_octo_spoon/views/AboutPageWidget.dart';
import 'package:jubilant_octo_spoon/views/GalleryPageWidget.dart';
import 'package:jubilant_octo_spoon/visuals/CircularImageWithDropShadowWidget.dart';
import 'package:jubilant_octo_spoon/visuals/ImageWithDropShadowWidget.dart';
import 'package:jubilant_octo_spoon/forms/email.dart';

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
  final List<String> galleryImages = [
    "images/apiResp.gif",
    "images/geminiChat.gif",
    "images/kubeBalance.gif",
    "images/weatherNotif.gif",
    "images/weather.gif",
    "images/train1.gif",
    "images/nightclub.gif",
    "images/combo.gif",
  ];

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
            //MobileAboutPageWidget()
            GalleryPageWidget(imagePaths: galleryImages),
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
            NavTextButton(label: 'home', isSelected: false, onPressed: () {}),
            SizedBox(width: 20),
            NavTextButton(label: 'about', isSelected: false, onPressed: () {}),
            SizedBox(width: 20),
            NavTextButton(
              label: 'projects',
              isSelected: false,
              onPressed: () {},
            ),
            SizedBox(width: 20),
            NavTextButton(label: 'news', isSelected: false, onPressed: () {}),
            SizedBox(width: 20),
            NavTextButton(
              label: 'gallery',
              isSelected: false,

              onPressed: () {},
            ),
            SizedBox(width: 20),

            NavTextButton(
              label: 'contact',
              isSelected: false,
              onPressed: () {},
            ),
            SizedBox(width: 20),
          ],
        ),
        body: Stack(
          children: [
            //DesktopAboutPageWidget(),
            GalleryPageWidget(imagePaths: galleryImages),

            MinimalSidebarWidget(),
          ],
        ),
      );
    }
  }
}
