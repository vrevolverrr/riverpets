import 'package:flutter/material.dart';
import 'package:riverpets/common/hover_anim.dart';
import 'package:riverpets/data/pets.dart';

class CatalogItem extends StatelessWidget {
  final Pet pet;

  const CatalogItem({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165.0,
      height: 225.0,
      decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(18.0),
          border: Border.all(color: Colors.black, width: 3.0),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Colors.black, offset: Offset(1.5, 1.5))
          ]),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 70.0,
              height: 25.0,
              margin: const EdgeInsets.only(left: 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Text(
                "RP#000${pet.tokenID}",
                style: const TextStyle(fontSize: 10.0),
              ),
            ),
          ),
          const SizedBox(height: 3.0),
          HoverAnim(
              intensity: 0.25,
              durationMillis: 1100,
              child: UnconstrainedBox(
                child: SizedBox(
                  width: 110.0,
                  height: 110.0,
                  child: Image.asset(pet.imagePath),
                ),
              )),
          Text(
            pet.name,
            style: const TextStyle(
                fontFamily: "MazzardH",
                fontWeight: FontWeight.w900,
                fontSize: 22.0),
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50.0,
                height: 25.0,
                margin: const EdgeInsets.only(left: 8.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  "❤️ ${pet.health}",
                  style: const TextStyle(fontSize: 10.0),
                ),
              ),
              Container(
                width: 50.0,
                height: 25.0,
                margin: const EdgeInsets.only(left: 8.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  "😊${pet.happiness}",
                  style: const TextStyle(fontSize: 10.0),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
