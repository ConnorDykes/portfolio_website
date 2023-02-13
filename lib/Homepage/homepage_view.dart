import 'package:flutter/material.dart';
import 'package:portfolio_website/main.dart';
import 'package:portfolio_website/theme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    double size = width < 450 ? 225.0 : 400.0;

    if (Styling.isLargeScreen(context)) {
      return DesktopScaffold(
        theme: theme,
        size: size,
      );
    } else {
      return MobileScaffold(
        size: size,
      );
    }
  }
}
