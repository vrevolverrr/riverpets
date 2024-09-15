import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpets/common/gesture_scale.dart';
import 'package:riverpets/data/pets.dart';
import 'package:riverpets/data/rivers.dart';
import 'package:riverpets/pages/pet_market/widgets/river_tile_card_bg.dart';
import 'package:riverpets/pages/pet_market/widgets/river_tile_card_sm.dart';
import 'package:riverpets/pages/pet_purchase/pet_purchase_page.dart';

class PetMarketPage extends StatelessWidget {
  const PetMarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 80.0),
          const Text(
            "Marketplace",
            style: TextStyle(
                fontFamily: "MazzardH",
                fontSize: 28.0,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: 330.0,
            height: 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
                color: Colors.grey[30],
                border: Border.all(color: Colors.black, width: 3.0),
                borderRadius: BorderRadius.circular(30.0)),
            child: const Row(
              children: <Widget>[
                Icon(Icons.search),
                SizedBox(width: 8.0),
                Text(
                  "Search for river or location",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "MazzardH",
                      fontSize: 15.0),
                )
              ],
            ),
          ),
          const SizedBox(height: 30.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                "critical rivers",
                style: TextStyle(
                    fontFamily: "MazzardH",
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                child: Row(
                  children: <Widget>[
                    GestureScale(
                        child: RiverTileCardSm(riverName: "Cupertino River")),
                    GestureScale(
                        child: RiverTileCardSm(riverName: "Cupertino River")),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                "rivers near you",
                style: TextStyle(
                    fontFamily: "MazzardH",
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          Column(
            children: GetIt.instance
                .get<RiverRepository>()
                .rivers
                .values
                .map((River river) => GestureScale(
                    onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => PetPurchasePage(
                            pet: GetIt.instance
                                .get<PetRepository>()
                                .pets
                                .firstWhere(
                                    (pet) => pet.riverID == river.riverID)))),
                    child: RiverTileCardBg(
                      river: river,
                    )) as Widget)
                .toList(),
          ),
          const SizedBox(height: 100.0),
        ],
      ),
    );
  }
}
