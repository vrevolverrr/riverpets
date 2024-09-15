import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpets/camera_service.dart';
import 'package:riverpets/data/global.dart';
import 'package:riverpets/data/pets.dart';
import 'package:riverpets/data/rivers.dart';
import 'package:riverpets/pages/riverpets_home.dart';
import 'package:camera/camera.dart';
import 'package:riverpets/services/config.dart';
import 'package:riverpets/services/rp_wallet.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.instance.registerSingleton<RiverRepository>(RiverRepository());
  GetIt.instance.registerSingleton<PetRepository>(PetRepository());
  GetIt.instance.registerSingleton<GlobalState>(GlobalState());
  // GetIt.instance.registerSingleton<VCInstance>(VCInstance(MNEMONIC));

  cameras = await availableCameras();

  runApp(const PetApp());
}

class PetApp extends StatelessWidget {
  const PetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "River Pets",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RiverPetsHome(),
    );
  }
}
