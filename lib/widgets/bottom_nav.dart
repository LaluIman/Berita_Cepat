import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp_flutter/screens/home/home_screen.dart';
import 'package:newsapp_flutter/screens/lifestyle/lifestylenews_screen.dart';
import 'package:newsapp_flutter/screens/politics/politics_screen.dart';
import 'package:newsapp_flutter/screens/sport/sport_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SportScreen(),
    LifestylenewsScreen(),
    PoliticsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/home_icon.svg'),
                label: "Beranda"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/sport_icon.svg'),
                label: "Olahraga"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/music_icon.svg'),
                label: "Gaya hidup"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/politic.svg'), label: "Politik"),
          ]),
    );
  }
}
