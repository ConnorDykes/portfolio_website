import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/navigation_destination.dart';
import 'package:portfolio_website/theme.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connor Dykes - Flutter Developer',
      theme: theme,
      home: const MyHomePage(title: 'About'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    double size = width < 450 ? 225.0 : 400.0;

    if (Styling.isLargeScreen(context)) {
      return DesktopScaffold(
        theme: theme,
        size: size,
        onTap: _onTap,
        selectedIndex: _selectedIndex,
      );
    } else {
      return MobileScaffold(
        theme: theme,
        size: size,
        onTap: _onTap,
        selectedIndex: _selectedIndex,
      );
    }
  }
}

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({
    super.key,
    required this.theme,
    required this.onTap,
    required this.selectedIndex,
    required this.size,
  });

  final ThemeData theme;
  final int selectedIndex;
  final Function onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          elevation: 3,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          selectedItemColor: theme.colorScheme.primary,
          selectedIconTheme: IconThemeData(color: theme.colorScheme.primary),
          currentIndex: selectedIndex,
          onTap: (index) => onTap(index),
          items: bottomNavBarDestination),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const NameAndDescription(),
              ProfilePhoto(
                size: Size(size, size),
              ),
              ContactMe(),
              AboutMe(
                isMobile: true,
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({
    super.key,
    required this.theme,
    required this.onTap,
    required this.selectedIndex,
    required this.size,
  });

  final ThemeData theme;
  final int selectedIndex;
  final Function onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          children: [
            NavigationRail(
              selectedIconTheme: IconThemeData(color: Colors.white),
              elevation: 3,
              minExtendedWidth: 200,
              selectedIndex: selectedIndex,
              extended: Styling.isLargeScreen(context),
              destinations: navRailDestinations,
              onDestinationSelected: (index) => onTap(index),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const NameAndDescription(),
                  ProfilePhoto(
                    size: Size(size, size),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: 25),
                    Flexible(child: ContactMe()),
                    SizedBox(height: 50),
                    Flexible(
                        flex: 2,
                        child: AboutMe(
                          isMobile: false,
                        )),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ContactMe extends StatelessWidget {
  const ContactMe({
    super.key,
  });

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

  Future<void> _github() async {
    final uri = Uri.parse('https://github.com/ConnorDykes');
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            textAlign: TextAlign.left,
            "Contact Me",
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
          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  FilledButton(
                    style: FilledButton.styleFrom(elevation: 3),
                    child: Icon(
                      Icons.phone_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () => _call(),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  SelectableText(
                    textAlign: TextAlign.left,
                    "Call",
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
              Column(
                children: [
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  FilledButton(
                    style: FilledButton.styleFrom(elevation: 3),
                    child: Icon(
                      Icons.email_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () => _email('mailto: connormdykes@gmail.com'),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  SelectableText(
                    textAlign: TextAlign.left,
                    "Email",
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
              Column(
                children: [
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  FilledButton(
                    style: FilledButton.styleFrom(elevation: 3),
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
        ]),
      ),
    );
  }
}

class AboutMe extends StatelessWidget {
  AboutMe({super.key, required this.isMobile});

  bool isMobile;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final width = constraints.maxWidth;
      return Card(
        child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8),
                      child: Text(
                        textAlign: TextAlign.center,
                        "About Me",
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
                  ]),
            )),
      );
    });
  }
}

class NameAndDescription extends StatefulWidget {
  const NameAndDescription({
    super.key,
  });

  @override
  State<NameAndDescription> createState() => _NameAndDescriptionState();
}

class _NameAndDescriptionState extends State<NameAndDescription>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(3, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticInOut,
      ),
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => SlideTransition(
        position: _animation,
        child: Column(
          children: [
            Text(
              "Connor Dykes",
              style: theme.textTheme.headlineLarge,
            ),
            Text(
              "Fullstack Flutter Developer",
              style: TextStyle(fontSize: 25, color: Colors.blue[800]),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePhoto extends StatefulWidget {
  ProfilePhoto({super.key, required this.size});
  Size size;

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 1,
      end: .8,
    ).animate(
      CurvedAnimation(
          parent: _controller, curve: Curves.ease, reverseCurve: Curves.ease),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: -50,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) => Transform.scale(
                scale: _animation.value,
                child: Center(
                  child: Container(
                    width: widget.size.width,
                    height: widget.size.height,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            )),
        Image.asset(
          'profile_photo.png',
          height: widget.size.height,
          width: widget.size.width,
        ),
      ],
    );
  }
}
