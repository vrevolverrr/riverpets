import 'package:flutter/material.dart';

class GestureScale extends StatefulWidget {
  final Widget child;
  final void Function()? onTap;

  const GestureScale({super.key, required this.child, this.onTap});

  @override
  State<GestureScale> createState() => _GestureScaleState();
}

class _GestureScaleState extends State<GestureScale> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() {
        _hover = true;
      }),
      onTapUp: (_) => setState(() {
        _hover = false;
      }),
      onTapCancel: () => setState(() {
        _hover = false;
      }),
      child: AnimatedScale(
        scale: !_hover ? 1.0 : 1.02,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 160),
        child: widget.child,
      ),
    );
  }
}
