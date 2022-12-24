import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mintacademy/controllers/navigation_controller.dart';
import 'package:mintacademy/widgets/getting_started_screen.dart';
import 'components/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Get.put(NavController(), tag: 'NavController');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigation bar',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: GettingStartedScreen(),
      routes: {
        //   '/': (ctx) => LandingPage(),
        BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
      },
    );
  }
}
