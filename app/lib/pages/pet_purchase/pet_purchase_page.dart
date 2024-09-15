import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpets/common/hover_anim.dart';
import 'package:riverpets/data/pets.dart';
import 'package:riverpets/data/rivers.dart';

class PetPurchasePage extends StatelessWidget {
  final Pet pet;

  const PetPurchasePage({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 80.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: 30.0,
                    ),
                  ),
                ),
                const Text(
                  "Purchase Pet",
                  style: TextStyle(
                      fontFamily: "MazzardH",
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  width: 50.0,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              width: 330.0,
              height: 224.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3.0),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(color: Colors.black, offset: Offset(2, 2))
                  ]),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      "assets/images/bg_landscape.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: HoverAnim(
                        intensity: 0.35,
                        child: SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: Image.asset(pet.imagePath),
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 35.0, bottom: 5.0),
                child: Text(
                  "about",
                  style: TextStyle(
                      fontFamily: "MazzardH",
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      pet.name,
                      style: const TextStyle(
                          fontFamily: "MazzardH",
                          fontWeight: FontWeight.w900,
                          fontSize: 30.0),
                    ),
                    const SizedBox(width: 15.0),
                    Container(
                      width: 90.0,
                      height: 28.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text("RP#000${pet.tokenID}"),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 90.0,
                      height: 33.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text("❤️ ${pet.health}"),
                    ),
                    const SizedBox(width: 14.0),
                    Container(
                      width: 90.0,
                      height: 33.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text("😊 ${pet.happiness}"),
                    ),
                    const SizedBox(width: 14.0),
                    Container(
                      width: 90.0,
                      height: 33.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text("⚡ ${pet.xp ~/ 10}"),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 35.0, bottom: 5.0),
                child: Text(
                  "river traits",
                  style: TextStyle(
                      fontFamily: "MazzardH",
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Text(
                  GetIt.instance
                      .get<RiverRepository>()
                      .rivers
                      .values
                      .where((river) => river.petTokenID == pet.tokenID)
                      .first
                      .name,
                  style: const TextStyle(
                      fontFamily: "MazzardH",
                      fontWeight: FontWeight.w900,
                      fontSize: 30.0),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 35.0, bottom: 5.0),
                child: Text(
                  "Pollution Index",
                  style: TextStyle(
                      fontFamily: "MazzardH",
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 35.0, bottom: 5.0),
                child: Text(
                  "0.98 WPI",
                  style: TextStyle(
                      fontFamily: "MazzardH",
                      fontWeight: FontWeight.w900,
                      fontSize: 24.0),
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 40.0),
                  width: 320.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.black, width: 3.0),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(
                              2,
                              2,
                            ))
                      ],
                      color: const Color(0xff96DE9D)),
                  child: Transform.translate(
                    offset: const Offset(-1, 2),
                    child: const Text(
                      "Purchase NFT",
                      style: TextStyle(
                          fontFamily: "MazzardH",
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
