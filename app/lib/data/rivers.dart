class River {
  String name;
  String country;
  int wpi;
  int riverID;
  int petTokenID;

  River(
      {required this.name,
      required this.country,
      required this.wpi,
      required this.riverID,
      required this.petTokenID});
}

class RiverRepository {
  final Map<int, River> rivers = {};

  RiverRepository() {
    // Do some logic to fetch river info from Web2 database
    rivers[1000] = River(
        name: "🇮🇩 Citarum River",
        country: "Indonesia",
        wpi: 97,
        riverID: 1000,
        petTokenID: 0);
    rivers[1001] = River(
        name: "🇲🇾 Klang River",
        country: "Malaysia",
        wpi: 64,
        riverID: 1001,
        petTokenID: 1);
    rivers[1002] = River(
        name: "🇸🇬 Kallang River",
        country: "Singapore",
        wpi: 27,
        riverID: 1002,
        petTokenID: 2);
    rivers[1003] = River(
        name: "🇸🇬 Geylang River",
        country: "Singapore",
        wpi: 23,
        riverID: 1003,
        petTokenID: 3);
  }
}
