import 'package:flutter/material.dart';
import 'package:portfolio_website/navigation_destination.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    int selectedIndex = 0;

    void onTap(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return BottomNavigationBar(
        elevation: 3,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        unselectedFontSize: 14,
        unselectedLabelStyle: TextStyle(color: Colors.amber),
        selectedItemColor: theme.colorScheme.primary,
        selectedIconTheme: IconThemeData(color: theme.colorScheme.primary),
        currentIndex: selectedIndex,
        onTap: (index) => onTap(index),
        items: bottomNavBarDestination);
  }
}
