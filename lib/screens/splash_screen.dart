import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:newsapp_flutter/screens/home/home_screen.dart';
import 'package:newsapp_flutter/widgets/bottom_nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNav()), (route) => false);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/BeritacepatFAV.png", width: 120, height: 120,),
            Text("Berita Cepat", style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      )
    );
  }
}