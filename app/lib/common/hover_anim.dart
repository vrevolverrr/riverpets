import 'package:flutter/material.dart';

class HoverAnim extends StatefulWidget {
  final Widget child;
  final double intensity;
  final int durationMillis;

  const HoverAnim(
      {super.key,
      required this.child,
      this.intensity = 1.0,
      this.durationMillis = 800});

  @override
  State<HoverAnim> createState() => _HoverAnimState();
}

class _HoverAnimState extends State<HoverAnim>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.durationMillis),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 25 * widget.intensity)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Transform.translate(
              offset: Offset(0, _animation.value),
              child: widget.child,
            ));
  }
}
