import 'package:flutter/material.dart';
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
      title: 'Flutter Demo',
      theme: theme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              NameAndDescription(),
              ProfilePhoto(
                size: Size(400, 400),
              ),
              AboutMe(theme: theme)
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class AboutMe extends StatelessWidget {
  const AboutMe({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Card(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.contain,
              alignment: width > 600 ? Alignment(-1, 0) : Alignment(-1.2, 0),
              image: AssetImage(
                'climbing.png',
              ),
            )),
        child: Padding(
          padding: EdgeInsets.only(left: width > 600 ? 130 : 160),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8),
                  child: Text(
                    textAlign: TextAlign.left,
                    "About Me",
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: Divider(
                    indent: 10,
                    endIndent: 10,
                    thickness: 3,
                    color: theme.colorScheme.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: Text(
                    textAlign: TextAlign.left,
                    """I am a driven self taught Fullstack Flutter Developer. I make apps for iOS, Android, Web, Windows, Mac & Linux. I love turning ideas into interactive experiences. 
          """,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: Text(
                    textAlign: TextAlign.left,
                    """I live in Longmont Colorado with my wife, daughter, two dogs, and three cats. In my free time I explore the mountains as a rock climber. I am a nerd at heart, You can catch me playing Dungeons and Dragons or Magic The Gathering 
          """,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                // Stack(
                //   children: [
                //     Positioned(
                //         bottom: -50,
                //         left: 0,
                //         child: Container(
                //           width: 100,
                //           height: 100,
                //           decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: Colors.blue,
                //           ),
                //         )),
                //     Image.asset(
                //       'climbing.png',
                //       height: 100,
                //       width: 100,
                //     ),
                //   ],
                // )
              ]),
        ),
      ),
    );
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
            left: 0,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) => Transform.scale(
                scale: _animation.value,
                child: Container(
                  width: widget.size.width,
                  height: widget.size.height,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
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
