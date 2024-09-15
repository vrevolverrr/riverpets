import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpets/common/hover_anim.dart';
import 'package:riverpets/data/global.dart';
import 'package:riverpets/pages/pet_home/widget/stat_bar.dart';

class PetHomePage extends StatelessWidget {
  const PetHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool shouldSnack = GetIt.instance.get<GlobalState>().shouldSnack;
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/big_bg.png",
          scale: 0.1,
          fit: BoxFit.contain,
        ),
        Positioned(
          top: 60.0,
          left: 14.0,
          child: XPStatBar(
            proportion: shouldSnack ? 0.9 : 0.5,
            asset: "assets/images/xp_bar.png",
          ),
        ),
        Positioned(
          top: 115.0,
          left: 14.0,
          child: StatBar(
              proportion: shouldSnack ? 1.0 : 0.2,
              asset: "assets/images/health_bar.png",
              colors: const [Color(0xffFF5766), Color(0xFFCC505E)]),
        ),
        Positioned(
          top: 170.0,
          left: 14.0,
          child: StatBar(
              proportion: shouldSnack ? 1.0 : 0.2,
              asset: "assets/images/happiness_bar.png",
              colors: const [Color(0xffFFB612), Color(0xFF8C4E03)]),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 60.0),
              HoverAnim(
                  child: SizedBox(
                width: 260.0,
                height: 260.0,
                child: Image.asset("assets/images/fishes/puff.png"),
              )),
              const SizedBox(height: 70.0),
            ],
          ),
        ),
        Container()
      ],
    );
  }
}
