import 'package:flutter/material.dart';
import 'package:jubilant_octo_spoon/content/image.dart';
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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    if (size.width < 900) {
      return const Scaffold(
        body: Stack(
          children: [
            MobileImageWithDropShadowWidget(),
            EmailForm()
          ],
        ),
      );
    } else {
      return const Scaffold(
        body: Stack(
          children: [
            DesktopImageWithDropShadowWidget(),
            EmailForm()
          ]
        ) 
      );
    }
  }
}