import 'package:flutter/material.dart';

class bottomNavBar extends StatelessWidget {
  final List<BottomNavigationBarItem> navigationBarItem;
  final  ValueChanged<int> ontap;
  final int selectedindex;
  const bottomNavBar({super.key, required this.navigationBarItem, required this.ontap, required this.selectedindex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: navigationBarItem,
      showUnselectedLabels: false,
      elevation: 20,
      currentIndex: selectedindex,
      onTap: ontap,
    );

  }


}
