import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Destination {
  final Widget icon;
  final Text title;
  final Widget selectedIcon;

  Destination(
      {required this.icon, required this.title, required this.selectedIcon});

  NavigationRailDestination get toNavigationDestination =>
      NavigationRailDestination(
        selectedIcon: selectedIcon,
        icon: icon,
        label: title,
      );

  BottomNavigationBarItem get toBottomDestination => BottomNavigationBarItem(
      activeIcon: selectedIcon,
      icon: icon,
      label: title.data,
      tooltip: title.data);
}

List<Destination> destinations = [
  Destination(
    selectedIcon: FaIcon(
      FontAwesomeIcons.solidAddressCard,
    ),
    title: const Text(
      "About Me",
    ),
    icon: const FaIcon(
      FontAwesomeIcons.addressCard,
      color: Colors.black,
    ),
  ),
  Destination(
    selectedIcon: Icon(
      Icons.work_rounded,
    ),
    title: const Text("Work"),
    icon: const Icon(
      Icons.work_outline_rounded,
      color: Colors.black,
    ),
  ),
  Destination(
    selectedIcon: Icon(
      Icons.devices_rounded,
    ),
    title: const Text("Projects"),
    icon: const Icon(
      Icons.devices_rounded,
      color: Colors.black,
    ),
  ),
  Destination(
    selectedIcon: Icon(
      Icons.school,
    ),
    title: const Text("Education"),
    icon: const Icon(
      Icons.school_outlined,
      color: Colors.black,
    ),
  ),
];

List<BottomNavigationBarItem> bottomNavBarDestination =
    destinations.map((d) => d.toBottomDestination).toList();

List<NavigationRailDestination> navRailDestinations =
    destinations.map((d) => d.toNavigationDestination).toList();
