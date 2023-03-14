import 'package:flutter/material.dart';

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
          'assets/profile_photo.png',
          height: widget.size.height,
          width: widget.size.width,
        ),
      ],
    );
  }
}
