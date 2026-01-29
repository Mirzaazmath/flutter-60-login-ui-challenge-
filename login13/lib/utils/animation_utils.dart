import 'package:flutter/material.dart';

class FadeTransitionAnimation extends StatefulWidget {
  final Widget child;
  final int duration;
  const FadeTransitionAnimation({
    super.key,
    required this.child,
    required this.duration,
  });

  @override
  State<FadeTransitionAnimation> createState() => _FadeTransitionAnimationState();
}

class _FadeTransitionAnimationState extends State<FadeTransitionAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: widget.duration),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
