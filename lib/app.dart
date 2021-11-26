import 'package:flutter/material.dart';

import 'pages/01_screen.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SplashScreen() ,
      debugShowCheckedModeBanner: false,
      title: "Viet Nhat App",
      theme: ThemeData(
        accentColor: Colors.white,
      ),
    );
  }
}
