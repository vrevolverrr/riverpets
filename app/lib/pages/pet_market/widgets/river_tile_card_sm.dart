import 'package:flutter/material.dart';
import 'package:riverpets/common/hover_anim.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class RiverTileCardSm extends StatelessWidget {
  final String riverName;

  const RiverTileCardSm({super.key, required this.riverName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 270.0,
      margin: const EdgeInsets.only(right: 35.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.black, width: 3.0),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Colors.black, offset: Offset(2, 2))
          ]),
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                "assets/images/river_polluted.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Transform(
              transform: Matrix4.translation(Vector3(10, -12, 0)),
              child: Container(
                width: 160.0,
                height: 38.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2.5),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(color: Colors.black, offset: Offset(2, 2))
                    ]),
                child: const Text(
                  "🇮🇩 Citranum River",
                  style: TextStyle(
                      fontFamily: "MazzardH",
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              transform: Matrix4.translation(Vector3(25, 20, 0)),
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 6.5),
                  shape: BoxShape.circle,
                  color: const Color(0xFF99CEEC)),
              child: Transform.translate(
                offset: const Offset(-2, -4),
                child: HoverAnim(
                    intensity: 0.2,
                    durationMillis: 1000,
                    child: UnconstrainedBox(
                      child: SizedBox(
                        width: 65.0,
                        height: 64.0,
                        child: Image.asset("assets/images/fishes/scary.png"),
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
