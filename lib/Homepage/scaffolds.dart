import 'package:flutter/material.dart';
import 'package:portfolio_website/Education/education_page.dart';
import 'package:portfolio_website/Homepage/about_me.dart';
import 'package:portfolio_website/Homepage/about_page.dart';
import 'package:portfolio_website/Homepage/contact_me.dart';
import 'package:portfolio_website/Homepage/my_navigation_rail.dart';
import 'package:portfolio_website/Projects/projects_page.dart';
import 'package:portfolio_website/Work/work_page.dart';
import 'package:portfolio_website/navigation_destination.dart';

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
        return const MobileAboutPage();

      case 1:
        return const MobileWorkPage();

      case 2:
        return const MobileProjectsPage();

      case 3:
        return const MobileEducationPage();

      default:
        return const MobileAboutPage();
    }
  }

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
      Scaffold.of(context).openDrawer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        drawer: Drawer(
            child: NavigationRail(
          backgroundColor: theme.scaffoldBackgroundColor,
          leading: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: const EdgeInsets.all(4),
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      color: Colors.blue[100],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/profile_photo.png')))),
              const Text(
                "Connor Dykes",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "Flutter Developer",
                style:
                    TextStyle(color: theme.colorScheme.primary, fontSize: 20),
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
          selectedIconTheme: const IconThemeData(color: Colors.white),
          elevation: 3,
          minExtendedWidth: 200,
          selectedIndex: selectedIndex,
          extended: true,
          destinations: navRailDestinations,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
            Navigator.pop(context);
          },
        )),
        floatingActionButton: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FloatingActionButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              child: const Icon(Icons.menu_rounded),
            ),
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
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

  final double size;
  final ThemeData theme;

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
        return const AboutPage();

      case 1:
        return const WorkPage();

      case 2:
        return const ProjectsPage();

      case 3:
        return const EducationPage();

      default:
        return AboutMe();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.theme.scaffoldBackgroundColor,
      body: NotificationListener<SelectNavIndexNotification>(
        onNotification: (notification) {
          setState(() {
            selectedIndex = notification.index;
          });
          return true;
        },
        child: ConstrainedBox(
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
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
