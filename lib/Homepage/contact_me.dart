import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBarContactMe extends StatelessWidget {
  const NavBarContactMe({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  Future<void> _email(string) async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'connormdykes@gmail.com',
    );
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> _call() async {
    final uri = Uri(
      scheme: 'tel',
      path: '4178611985',
    );
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  // Future<void> _github() async {
  //   final uri = Uri.parse('https://github.com/ConnorDykes');
  //   if (!await launchUrl(uri)) {
  //     throw Exception('Could not launch $uri');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 1,
                width: 200,
                color: Colors.grey[300],
              ),
              Text(
                "Contact me",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, elevation: 3),
                        child: Container(
                          width: 85,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.phone_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                textAlign: TextAlign.left,
                                "Call",
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () => _call(),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, elevation: 3),
                        child: Container(
                          width: 85,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.email_rounded, color: Colors.white),
                              Text(
                                textAlign: TextAlign.left,
                                "Email",
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () =>
                            _email('mailto: connormdykes@gmail.com'),
                      ),
                    ],
                  ),
                ),
              ),
              //   Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Container(
              //       width: 200,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //                 backgroundColor: Colors.blue, elevation: 3),
              //             child: Container(
              //               width: 85,
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   FaIcon(
              //                     FontAwesomeIcons.github,
              //                     color: Colors.white,
              //                   ),
              //                   Text(
              //                     textAlign: TextAlign.left,
              //                     "GitHub",
              //                     style: theme.textTheme.bodyLarge!
              //                         .copyWith(color: Colors.white),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             onPressed: () => _github(),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyInfo extends StatelessWidget {
  const MyInfo({
    super.key,
  });

  Future<void> _github() async {
    final uri = Uri.parse('https://github.com/ConnorDykes');
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
   
    return Card(
      child: Container(
        padding: EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  FilledButton(
                    style: FilledButton.styleFrom(elevation: 3),
                    child: const Icon(
                      Icons.file_present_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      AnchorElement anchorElement =
                          AnchorElement(href: 'assets/resume.pdf');
                      anchorElement.download = "Download Resume";
                      anchorElement.click();
                    },
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Text(
                    textAlign: TextAlign.left,
                    "Resume",
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
              Column(
                children: [
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      elevation: 3,
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                    ),
                    onPressed: () => _github(),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Text(
                    textAlign: TextAlign.left,
                    "GitHub",
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
