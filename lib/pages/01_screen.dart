import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vietnhat/pages/02_home.dart';
import 'package:vietnhat/shares/share.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds:3 ),()=>Navigator.push(context,
        MaterialPageRoute(builder: (context)=>HomePage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width:double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: Image.asset("assets/logo/logoizi.png"),width: MediaQuery.of(context).size.width*0.7,)
            ],
          ),
        ),
    );
  }
}
