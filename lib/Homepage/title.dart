import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyTitle extends StatelessWidget {
  const MyTitle({
    super.key,
    required this.theme,
  });

  final ThemeData theme;
  Future<void> _github() async {
    final uri = Uri.parse('https://github.com/ConnorDykes');
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 40),
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            "I am a Fullstack Flutter Developer.",
            style: theme.textTheme.headlineLarge!
                .copyWith(color: theme.colorScheme.primary, fontSize: 42),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Text(
            textAlign: TextAlign.center,
            "I build apps, like this website!",
            style: theme.textTheme.headlineLarge!.copyWith(fontSize: 32),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          FilledButton(
              onPressed: () => _github(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.github),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Text('See The Code'),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ))
        ],
      ),
    );
  }
}
