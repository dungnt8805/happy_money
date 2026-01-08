import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:happy_money/app/utils/utils.dart';

class Bouncing extends StatefulWidget {
  const Bouncing({
    required this.child,
    this.onTap,
    this.onLongTap,
    this.onDoubleTap,
    this.scaleFactor = -0.1,
    this.behavior,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final VoidCallback? onDoubleTap;

  /// Scale factor
  ///  [scaleFactor] < 0 => [child] will be minimized on tap
  ///  [scaleFactor] = 0 => [child] nothing changed
  ///  [scaleFactor] > 0 => [child] will be maximized on tap
  final double scaleFactor;
  final HitTestBehavior? behavior;

  @override
  State<Bouncing> createState() => _BouncingState();
}

class _BouncingState extends State<Bouncing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  Timer? timer;
  bool isPressed = false;
  bool isSingleTap = false;
  bool isDoubleTap = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      upperBound: 0.1,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    );

    _animation.addListener(() => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: widget.behavior,
      onTap: (widget.onDoubleTap != null) ? _onTap : widget.onTap,
      onLongPress: widget.onLongTap,
      onTapDown: _onTapDown,
      onTapUp: (_) => _controller.animateTo(0, duration: 100.ms),
      onTapCancel: _onTapCancel,
      child: Transform.scale(
        scale: 1 + (_controller.value * widget.scaleFactor),
        child: widget.child,
      ),
    );
  }

  void _onTap() {
    isPressed = false;

    if (isSingleTap) {
      isSingleTap = false;
      widget.onTap?.call(); // call user onTap function
    }

    if (isDoubleTap) {
      isDoubleTap = false;
      widget.onDoubleTap?.call();
    }
  }

  void _onTapDown(TapDownDetails details) {
    _controller.animateTo(1, duration: 0.us);

    isPressed = true;
    if (timer != null && (timer?.isActive ?? false)) {
      isDoubleTap = true;
      timer?.cancel();
      return;
    }

    timer = Timer(const Duration(milliseconds: 300), _doubleTapTimerElapsed);
  }

  void _doubleTapTimerElapsed() {
    if (isPressed) {
      isSingleTap = true;
      return;
    }

    widget.onTap?.call();
  }

  void _onTapCancel() {
    _controller.value = 0;

    isPressed = isSingleTap = isDoubleTap = false;

    if (timer != null && (timer?.isActive ?? false)) {
      timer?.cancel();
    }
  }
}
