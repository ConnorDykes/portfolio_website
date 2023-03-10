import 'package:flutter/material.dart';
import 'package:portfolio_website/Education/education_page.dart';
import 'package:portfolio_website/Homepage/about_me.dart';
import 'package:portfolio_website/Homepage/about_page.dart';
import 'package:portfolio_website/Homepage/contact_me.dart';
import 'package:portfolio_website/Homepage/homepage_view.dart';
import 'package:portfolio_website/Homepage/my_navigation_rail.dart';
import 'package:portfolio_website/Homepage/title.dart';
import 'package:portfolio_website/Homepage/what_I_do.dart';
import 'package:portfolio_website/NavBar/name_and_description.dart';
import 'package:portfolio_website/NavBar/profile_photo.dart';
import 'package:portfolio_website/Projects/projects_page.dart';
import 'package:portfolio_website/Work/work_page.dart';
import 'package:portfolio_website/navigation_destination.dart';
import 'package:portfolio_website/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connor Dykes - Flutter Developer',
      theme: theme,
      home: const MyHomePage(title: 'About Me'),
    );
  }
}

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({
    super.key,
    required this.size,
  });

  final double size;

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  int selectedIndex = 0;
  mainPageView(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return MobileAboutPage();

      case 1:
        return MobileWorkPage();

      case 2:
        return MobileProjectsPage();

      case 3:
        return MobileEducationPage();

      default:
        return MobileAboutPage();
    }
  }

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            elevation: 3,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.black,
            unselectedFontSize: 14,
            unselectedLabelStyle: TextStyle(color: Colors.amber),
            selectedItemColor: theme.colorScheme.primary,
            selectedIconTheme: IconThemeData(color: theme.colorScheme.primary),
            currentIndex: selectedIndex,
            onTap: (index) => onTap(index),
            items: bottomNavBarDestination),
        backgroundColor: theme.scaffoldBackgroundColor,
        body: mainPageView(selectedIndex));
  }
}

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({
    super.key,
    required this.theme,
    required this.size,
  });

  final ThemeData theme;
  final double size;

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  int selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  mainPageView(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return AboutPage();

      case 1:
        return WorkPage();

      case 2:
        return ProjectsPage();

      case 3:
        return EducationPage();

      default:
        return AboutMe();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.theme.scaffoldBackgroundColor,
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: Row(
          children: [
            MyNavigationRail(
                theme: widget.theme,
                selectedIndex: selectedIndex,
                onTap: onTap),
            mainPageView(selectedIndex)
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
