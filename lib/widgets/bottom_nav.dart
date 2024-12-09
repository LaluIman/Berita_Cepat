import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/home_icon.svg'), label: "Beranda"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/sport_icon.svg'), label: "Olahraga"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/music_icon.svg'), label: "Gaya hidup"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/politic.svg'), label: "Politik"),
        ]);
  }
}
