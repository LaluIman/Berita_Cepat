import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp_flutter/screens/splash_screen.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    defaultDevice: Devices.ios.iPhone13ProMax,
    devices: [Devices.ios.iPhone13ProMax],
    builder: (context) =>  const MainApp()
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        textTheme: GoogleFonts.dmSansTextTheme(),
      ),
      home: Scaffold(
        body: Center(
          child: SplashScreen(),
        ),
      ),
    );
  }
}
