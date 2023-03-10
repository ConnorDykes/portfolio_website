import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  AboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
          decoration: BoxDecoration(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "About Me",
                  style: theme.textTheme.headlineMedium,
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
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    textAlign: TextAlign.center,
                    """I am a driven self taught Fullstack Flutter Developer. I make apps for iOS, Android, Web, Windows, Mac & Linux. I love turning ideas into interactive experiences. I have worked at several start ups as well as developed apps for personal and professional use.
          """,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      textAlign: TextAlign.center,
                      """I live in Longmont Colorado with my wife, daughter, two dogs, and three cats. In my free time I explore the mountains as a rock climber. I am a nerd at heart, You can catch me playing Dungeons and Dragons or Magic The Gathering 
          """,
                      style: theme.textTheme.bodyLarge,
                    )),
                //
              ])),
    );
  }
}
