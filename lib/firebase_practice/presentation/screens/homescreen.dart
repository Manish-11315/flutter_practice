import 'package:flutter/material.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/screens/dashboardscreen.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/screens/profilescreen.dart';

import '../widgets/bottomnavbar.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int selectedState = 0;
  final List<Widget> screens = [
    dashBoard(),
    profileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedState,children: screens,),
      bottomNavigationBar: bottomNavBar(
        ontap: (index){
          setState(() {
            selectedState = index;
          });
        },
        selectedindex: selectedState,
        navigationBarItem: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
