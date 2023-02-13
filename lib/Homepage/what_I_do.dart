import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WhatIDo extends StatefulWidget {
  WhatIDo({super.key, required this.isMobile});

  bool isMobile;

  @override
  State<WhatIDo> createState() => _WhatIDoState();
}

class _WhatIDoState extends State<WhatIDo> {
  int segmentedControlGroupValue = 0;
  final Map<int, Widget> tabs = const <int, Widget>{
    0: Text("Platforms"),
    1: Text("Languages")
  };

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      width: 350,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8),
            child: Text(
              textAlign: TextAlign.center,
              "What I Do",
              style: theme.textTheme.headlineMedium,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Divider(
              indent: 10,
              endIndent: 10,
              thickness: 3,
              color: theme.colorScheme.primary,
            ),
          ),
          CupertinoSlidingSegmentedControl(
              groupValue: segmentedControlGroupValue,
              children: {0: Text("Platforms"), 1: Text("Languages")},
              onValueChanged: (value) {
                if (value != null) {
                  debugPrint(value.toString());
                  setState(() {
                    segmentedControlGroupValue = value;
                  });
                }
              }),
          // todo: this isnt working
          if (segmentedControlGroupValue == 0) ...{
            GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: platformGridViewItems),
          } else ...{
            GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: languagesGridViewItems)
          }
        ],
      ),
    );
  }
}

class GridViewItem {
  final Widget icon;
  final Text title;

  GridViewItem({required this.icon, required this.title});

  Container get toGridViewItem => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [icon, title]),
      );
}

final platforms = [
  GridViewItem(
      icon: FlutterLogo(
        size: 48,
      ),
      title: Text("Flutter")),
  GridViewItem(
      icon: Image.asset(
        'firebase.png',
        height: 48,
        width: 48,
      ),
      title: Text("Firebase")),
  GridViewItem(
      icon: FaIcon(
        FontAwesomeIcons.apple,
        color: Colors.black,
        size: 48,
      ),
      title: Text("iOS")),
  GridViewItem(
      icon: FaIcon(
        FontAwesomeIcons.android,
        color: Colors.lightGreen,
        size: 48,
      ),
      title: Text("Android")),
  GridViewItem(
      icon: FaIcon(
        FontAwesomeIcons.code,
        size: 48,
      ),
      title: Text("Web")),
  GridViewItem(
      icon: FaIcon(
        FontAwesomeIcons.html5,
        color: Colors.red,
        size: 48,
      ),
      title: Text("HTML 5")),
  GridViewItem(
      icon: FaIcon(
        FontAwesomeIcons.css3,
        size: 48,
      ),
      title: Text("CSS 3")),
  GridViewItem(
      icon: FaIcon(
        FontAwesomeIcons.squareJs,
        color: Colors.amber,
        size: 48,
      ),
      title: Text("Java Script")),
];

final languages = [
  GridViewItem(
      icon: FaIcon(
        FontAwesomeIcons.html5,
        color: Colors.red,
        size: 48,
      ),
      title: Text("HTML 5")),
  GridViewItem(
      icon: FaIcon(
        FontAwesomeIcons.css3,
        size: 48,
      ),
      title: Text("CSS 3")),
  GridViewItem(
      icon: FaIcon(
        FontAwesomeIcons.squareJs,
        color: Colors.amber,
        size: 48,
      ),
      title: Text("Java Script")),
];

List<Container> platformGridViewItems =
    platforms.map((platform) => platform.toGridViewItem).toList();

List<Container> languagesGridViewItems =
    platforms.map((platform) => platform.toGridViewItem).toList();
