import 'package:flutter/material.dart';

class StatBar extends StatelessWidget {
  final double proportion;
  final String asset;
  final List<Color> colors;
  const StatBar(
      {super.key,
      required this.proportion,
      required this.colors,
      required this.asset});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(asset),
        Positioned(
            top: 18.2,
            left: 55.8,
            child: AnimatedContainer(
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 120),
              height: 17.4,
              width: proportion * 133, // 0 to 148
              // color: const Color(0xffFF5766),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: colors,
                    stops: const [0.65, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            )),
      ],
    );
  }
}

class XPStatBar extends StatelessWidget {
  final double proportion;
  final String asset;

  const XPStatBar({super.key, required this.proportion, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(asset),
        Positioned(
            top: 18.2,
            left: 55.8,
            child: AnimatedContainer(
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 120),
              height: 17.4,
              width: proportion * 184, // 0 to 148
              // color: const Color(0xffFF5766),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff2DC4F9), Color(0xFF218FB7)],
                    stops: [0.65, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            )),
        const Positioned(
            top: 10.0,
            left: 18.9,
            child: Text(
              "3",
              style: TextStyle(
                  color: Color(0xFFE9E9E9),
                  fontFamily: "MazzardH",
                  fontSize: 26.0,
                  fontWeight: FontWeight.w900),
            )),
      ],
    );
  }
}
