import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpets/common/hover_anim.dart';
import 'package:riverpets/data/pets.dart';
import 'package:riverpets/data/rivers.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class RiverTileCardBg extends StatelessWidget {
  final River river;

  const RiverTileCardBg({super.key, required this.river});

  @override
  Widget build(BuildContext context) {
    Pet pet = GetIt.instance
        .get<PetRepository>()
        .pets
        .firstWhere((pet) => pet.riverID == river.riverID);

    return Stack(
      children: <Widget>[
        Container(
          width: 340.0,
          height: 210.0,
          margin: const EdgeInsets.only(bottom: 30.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3.5),
              borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 200.0,
                height: 210.0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0)),
                  child: Image.asset(
                    "assets/images/river_polluted.jpg",
                    fit: BoxFit.cover,
                    scale: 2,
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 210.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                        child: Image.asset(
                          "assets/images/bg.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 10.0, right: 10.0),
                          width: 75.0,
                          height: 28.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Transform.translate(
                            offset: const Offset(-1, 1),
                            child: Text(
                              "#000${pet.tokenID}",
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "MazzardH"),
                            ),
                          ),
                        )),
                    Positioned(
                      top: 35.0,
                      left: 14.0,
                      child: HoverAnim(
                          intensity: 0.35,
                          child: SizedBox(
                            width: 100.0,
                            height: 100.0,
                            child: Image.asset(pet.imagePath),
                          )),
                    ),
                    Positioned(
                        left: 12.0,
                        bottom: 20.0,
                        child: Container(
                          width: 108.0,
                          height: 38.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              border:
                                  Border.all(color: Colors.black, width: 2.0),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black, offset: Offset(1, 1))
                              ]),
                          child: Transform.translate(
                            offset: const Offset(0, 1),
                            child: Text(
                              "RVP\$ ${pet.price}",
                              style: const TextStyle(
                                  fontFamily: "MazzardH",
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.centerLeft,
            transform: Matrix4.translation(Vector3(-10, -8, 0)),
            width: 200.0,
            height: 40.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2.5),
                borderRadius: BorderRadius.circular(18.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(color: Colors.black, offset: Offset(4, 2))
                ]),
            child: Text(
              river.name,
              style: const TextStyle(
                  fontFamily: "MazzardH",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }
}
