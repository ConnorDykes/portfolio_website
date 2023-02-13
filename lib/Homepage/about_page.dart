import 'package:flutter/material.dart';
import 'package:portfolio_website/Homepage/about_me.dart';
import 'package:portfolio_website/Homepage/title.dart';
import 'package:portfolio_website/Homepage/what_I_do.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Row(
        children: [
          SizedBox(width: 25),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[WhatIDo(isMobile: false)],
            ),
          ),
          SizedBox(width: 50),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTitle(theme: theme),
                Divider(thickness: 1, color: Colors.grey[300]),
                AboutMe(
                  isMobile: false,
                ),
              ],
            ),
          ),
          // Flexible(child: ContactMe()),
          SizedBox(width: 25),
        ],
      ),
    );
  }
}
