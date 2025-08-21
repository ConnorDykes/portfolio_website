import 'package:flutter/material.dart';
import 'package:portfolio_website/Homepage/about_me.dart';
import 'package:portfolio_website/Homepage/contact_me.dart';
import 'package:portfolio_website/Homepage/title.dart';
import 'package:portfolio_website/Homepage/what_I_do.dart';
import 'package:portfolio_website/NavBar/name_and_description.dart';
import 'package:portfolio_website/NavBar/profile_photo.dart';

class SelectNavIndexNotification extends Notification {
  const SelectNavIndexNotification(this.index);
  final int index;
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Row(
        children: [
          const SizedBox(width: 25),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTitle(
                  theme: theme,
                  onSeeApps: () {
                    const SelectNavIndexNotification(2).dispatch(context);
                  },
                ),
                Divider(thickness: 1, color: Colors.grey[300]),
                AboutMe(),
              ],
            ),
          ),
          const SizedBox(width: 50),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[WhatIDo(isMobile: false)],
            ),
          ),
          const SizedBox(width: 25),
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
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: NameAndDescription(),
            ),
            ProfilePhoto(
              size: Size(size, size),
            ),
            const MyInfo(),
            AboutMe(),
            WhatIDo(isMobile: true)
          ],
        ),
      ),
    );
  }
}
