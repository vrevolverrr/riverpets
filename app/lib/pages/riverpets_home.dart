import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpets/data/global.dart';
import 'package:riverpets/pages/camera/camera_page.dart';
import 'package:riverpets/pages/pet_home/pet_home_page.dart';
import 'package:riverpets/pages/pet_market/pet_market_page.dart';
import 'package:riverpets/pages/pets_catalog/pets_catalog_page.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class RiverPetsHome extends StatefulWidget {
  const RiverPetsHome({super.key});

  @override
  State<RiverPetsHome> createState() => _RiverPetsHomeState();
}

class _RiverPetsHomeState extends State<RiverPetsHome>
    with SingleTickerProviderStateMixin {
  late final AnimationController _snackbarController;
  late final Animation<double> _snackAnimation;
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 1);

    _snackbarController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _snackbarController.duration = const Duration(milliseconds: 1200);
    _snackAnimation = Tween<double>(begin: 20.0, end: -120.0)
        .chain(CurveTween(curve: Curves.elasticOut))
        .animate(_snackbarController);

    if (GetIt.instance.get<GlobalState>().shouldSnack) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (_snackbarController.isAnimating) return;

        _snackbarController.forward(from: 0.0);
        Future.delayed(
            const Duration(seconds: 2), () => _snackbarController.reverse());
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const ClampingScrollPhysics(),
            children: const <Widget>[
              PetsCatalogPage(),
              PetHomePage(),
              PetMarketPage()
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
                animation: _snackAnimation,
                builder: (context, child) => Transform.translate(
                      offset: Offset(0, _snackAnimation.value),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        width: 330.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.black, width: 3.0),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black, offset: Offset(1, 2))
                            ]),
                        child: const Text(
                          "🔥 Got RVP\$ 10.00 for keeping river clean",
                          style: TextStyle(
                              fontFamily: "MazzardH",
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0),
                        ),
                      ),
                    )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 3.0),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const CameraApp())),
                      child: Container(
                        alignment: Alignment.center,
                        transform: Matrix4.translation(Vector3(0, -30, 0)),
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.black, width: 3.0),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black, offset: Offset(2, 2))
                            ],
                            color: Colors.white),
                        child: Transform.translate(
                            offset: const Offset(-1, -2),
                            child: const Text("📷",
                                style: TextStyle(fontSize: 28.0))),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "🐟",
                        style: TextStyle(fontSize: 32.0, height: 2.0),
                      ),
                      SizedBox(width: 0.0),
                      Text(
                        "🛍️",
                        style: TextStyle(fontSize: 32.0),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
