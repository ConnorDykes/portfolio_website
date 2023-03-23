import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/theme.dart';

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
    debugPrint(segmentedControlGroupValue.toString());
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
              thumbColor: theme.colorScheme.primary,
              groupValue: segmentedControlGroupValue,
              children: {
                0: Text("Platforms",
                    style: TextStyle(
                        color: segmentedControlGroupValue == 0
                            ? Colors.white
                            : Colors.black)),
                1: Text(
                  "Languages",
                  style: TextStyle(
                      color: segmentedControlGroupValue == 1
                          ? Colors.white
                          : Colors.black),
                )
              },
              onValueChanged: (value) {
                if (value != null) {
                  setState(() {
                    segmentedControlGroupValue = value;
                  });
                }
              }),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 450),
            child: GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: segmentedControlGroupValue == 0
                    ? platformGridViewItems
                    : languagesGridViewItems),
          )
        ],
      ),
    );
  }
}

class GridViewItem extends StatelessWidget {
  GridViewItem({
    required this.icon,
    required this.title,
    Color? this.color,
  });
  final Widget icon;
  final Text title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [icon, title]),
    );
    ;
  }
}

// class GridViewItem {

//   GridViewItem({required this.icon, required this.title});

//   Container get toGridViewItem => Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10), color: Colors.white),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [icon, title]),
//       );
// }

final platforms = [
  GridViewItem(
      icon: FlutterLogo(
        size: 48,
      ),
      title: Text("Flutter")),
  GridViewItem(
      icon: Image.asset(
        'assets/firebase.png',
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
      title: Text("iOS & MacOS")),
  GridViewItem(
      icon: FaIcon(
        FontAwesomeIcons.android,
        color: Colors.lightGreen,
        size: 48,
      ),
      title: Text("Android")),
  GridViewItem(
      icon: FaIcon(
        FontAwesomeIcons.windows,
        size: 48,
      ),
      title: Text("Windows & Desktop")),
  GridViewItem(
      icon: FaIcon(
        FontAwesomeIcons.code,
        size: 48,
        color: Colors.lightBlue,
      ),
      title: Text("Web")),
];

final languages = [
  GridViewItem(
      icon: Image.asset(
        'assets/dart.png',
        height: 48,
        width: 48,
      ),
      title: Text("Dart")),
  GridViewItem(
      icon: Image.asset(
        'assets/kotlin.png',
        height: 48,
        width: 48,
      ),
      title: Text("Kotlin")),
  GridViewItem(
      icon: Image.asset(
        'assets/swift.png',
        height: 48,
        width: 48,
      ),
      title: Text("Swift")),
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

List<GridViewItem> platformGridViewItems = platforms
    .map((platform) => GridViewItem(
          icon: platform.icon,
          title: platform.title,
        ))
    .toList();

List<GridViewItem> languagesGridViewItems = languages
    .map((language) => GridViewItem(
          icon: language.icon,
          title: language.title,
        ))
    .toList();
