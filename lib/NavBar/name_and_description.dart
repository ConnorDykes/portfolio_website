import 'package:flutter/material.dart';

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
