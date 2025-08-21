import 'package:flutter/material.dart';
import 'package:portfolio_website/Homepage/homepage_view.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Connor Dykes - Flutter Developer',
      theme: theme,
      home: const MyHomePage(title: 'About Me'),
    );
  }
}

// Scaffolds moved to `Homepage/scaffolds.dart` to avoid circular imports.
