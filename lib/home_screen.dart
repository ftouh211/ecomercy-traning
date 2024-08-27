import 'package:ecomercy/about_us.dart';
import 'package:ecomercy/basic.dart';
import 'package:ecomercy/profiel.dart';
import 'package:ecomercy/catigories.dart';
import 'package:ecomercy/team.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          backgroundColor:Color(0xff141A2E),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: ""),
          ]),
      body: tabs[selectedIndex],


  );
  }
}

List<Widget> tabs = [
  Basic(),
  Profiel(),
  CatigoriesPage()
];