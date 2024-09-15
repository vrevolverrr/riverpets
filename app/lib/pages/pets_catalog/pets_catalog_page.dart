import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpets/data/pets.dart';
import 'package:riverpets/pages/pets_catalog/widgets/catalog_item.dart';

class PetsCatalogPage extends StatefulWidget {
  const PetsCatalogPage({super.key});

  @override
  State<PetsCatalogPage> createState() => _PetsCatalogPageState();
}

class _PetsCatalogPageState extends State<PetsCatalogPage> {
  @override
  void initState() {
    // TODO fetch from VC

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pets = GetIt.instance.get<PetRepository>().pets;

    return Column(
      children: <Widget>[
        const SizedBox(height: 80.0),
        const Text(
          "Owned Pets",
          style: TextStyle(
              fontFamily: "MazzardH",
              fontSize: 28.0,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 20.0),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CatalogItem(
                    pet: pets[1],
                  ),
                  CatalogItem(
                    pet: pets[2],
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CatalogItem(
                    pet: pets[0],
                  ),
                  CatalogItem(
                    pet: pets[3],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
