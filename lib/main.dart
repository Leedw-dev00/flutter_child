import 'package:flutter/material.dart';
import 'package:flutter_child/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: Colors.white),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SplashScreenView(
        navigateRoute: LoginPage(),
        duration: 4000,
        imageSize: 700,
        imageSrc: 'assets/images/splash_logo.png',
        backgroundColor: Colors.white,
      ),
    );
  }
}
