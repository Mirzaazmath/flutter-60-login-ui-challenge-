import 'dart:async';
import 'package:flutter/material.dart';

class ShowUpAnimation extends StatefulWidget {
  /// Child widget to animate
  final Widget child;

  /// Delay before starting the animation
  final int? delay;

  /// Whether to play the animation in reverse
  final bool reverse;

  const ShowUpAnimation({
    Key? key,
    required this.child,
    this.delay,
    this.reverse = false,
  }) : super(key: key);

  @override
  State<ShowUpAnimation> createState() => _ShowUpAnimationState();
}

class _ShowUpAnimationState extends State<ShowUpAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    final curve = CurvedAnimation(
      parent: _animController,
      curve: Curves.decelerate,
    );

    _animOffset = Tween<Offset>(
      begin: const Offset(0.0, 0.35),
      end: Offset.zero,
    ).animate(curve);

    _startAnimation();
  }

  void _startAnimation() {
    _timer?.cancel();
    if (widget.delay == null) {
      _playAnimation();
    } else {
      _timer = Timer(Duration(milliseconds: widget.delay!), _playAnimation);
    }
  }

  void _playAnimation() {
    if (widget.reverse) {
      _animController.reverse();
    } else {
      _animController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant ShowUpAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If reverse value changed, trigger animation accordingly
    if (oldWidget.reverse != widget.reverse) {
      _playAnimation();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
