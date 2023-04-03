import 'package:flutter/material.dart';
import 'package:portfolio_website/Homepage/about_me.dart';
import 'package:portfolio_website/Homepage/contact_me.dart';
import 'package:portfolio_website/Homepage/title.dart';
import 'package:portfolio_website/Homepage/what_I_do.dart';
import 'package:portfolio_website/NavBar/name_and_description.dart';
import 'package:portfolio_website/NavBar/profile_photo.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Row(
        children: [
          SizedBox(width: 25),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTitle(theme: theme),
                Divider(thickness: 1, color: Colors.grey[300]),
                AboutMe(),
              ],
            ),
          ),
          SizedBox(width: 50),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[WhatIDo(isMobile: false)],
            ),
          ),
          SizedBox(width: 25),
        ],
      ),
    );
  }
}

class MobileAboutPage extends StatelessWidget {
  const MobileAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    double size = width < 450 ? 225.0 : 400.0;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: const NameAndDescription(),
            ),
            ProfilePhoto(
              size: Size(size, size),
            ),
            MyInfo(),
            AboutMe(),
            WhatIDo(isMobile: true)
          ],
        ),
      ),
    );
  }
}
