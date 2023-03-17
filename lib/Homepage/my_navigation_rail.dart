import 'package:flutter/material.dart';
import 'package:portfolio_website/Homepage/contact_me.dart';
import 'package:portfolio_website/NavBar/profile_photo.dart';
import 'package:portfolio_website/main.dart';
import 'package:portfolio_website/navigation_destination.dart';
import 'package:portfolio_website/theme.dart';

class MyNavigationRail extends StatelessWidget {
  const MyNavigationRail({
    super.key,
    required this.theme,
    required this.selectedIndex,
    required this.onTap,
  });

  final ThemeData theme;
  final int selectedIndex;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      leading: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfilePhoto(size: Size(150, 150)),
          Text(
            "Connor Dykes",
            style: TextStyle(fontSize: 22),
          ),
          Text(
            "Flutter Developer",
            style: TextStyle(color: theme.colorScheme.primary, fontSize: 20),
          ),
          Container(
            height: 1,
            width: 200,
            color: Colors.grey[300],
          ),
        ],
      ),
      trailing: NavBarContactMe(theme: theme),
      selectedLabelTextStyle:
          TextStyle(color: theme.colorScheme.primary, fontSize: 18),
      selectedIconTheme: IconThemeData(color: Colors.white),
      elevation: 3,
      minExtendedWidth: 200,
      selectedIndex: selectedIndex,
      extended: true,
      destinations: navRailDestinations,
      onDestinationSelected: (index) => onTap(index),
    );
  }
}
