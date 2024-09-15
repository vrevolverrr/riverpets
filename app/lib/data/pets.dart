class Pet {
  String name;
  int health;
  int happiness;
  int xp;
  int riverID;
  int tokenID;
  double price;
  String imagePath;

  Pet(
      {required this.name,
      this.happiness = 100,
      this.health = 100,
      this.xp = 1,
      required this.riverID,
      required this.tokenID,
      required this.price,
      required this.imagePath});
}

class PetRepository {
  final List<Pet> pets = [];

  PetRepository() {
    // Do some logic to fetch river info from Web2 database
    pets.add(Pet(
        name: "Bluey",
        health: 82,
        happiness: 53,
        xp: 22,
        riverID: 1000,
        tokenID: 0,
        price: 23.15,
        imagePath: "assets/images/fishes/bluey.png"));

    pets.add(Pet(
        name: "Dory",
        health: 90,
        happiness: 43,
        xp: 13,
        riverID: 1001,
        tokenID: 1,
        price: 54.82,
        imagePath: "assets/images/fishes/dory.png"));

    pets.add(Pet(
        name: "Puff",
        health: 73,
        happiness: 34,
        xp: 25,
        riverID: 1002,
        tokenID: 2,
        price: 75.23,
        imagePath: "assets/images/fishes/puff.png"));

    pets.add(Pet(
        name: "Purple",
        health: 95,
        happiness: 98,
        xp: 4,
        riverID: 1003,
        tokenID: 3,
        price: 45.23,
        imagePath: "assets/images/fishes/purple.png"));

    pets.add(Pet(
        name: "Red",
        health: 84,
        happiness: 92,
        xp: 8,
        riverID: 1000,
        tokenID: 4,
        price: 64.28,
        imagePath: "assets/images/fishes/red.png"));

    pets.add(Pet(
        name: "Scary",
        health: 95,
        happiness: 93,
        xp: 15,
        riverID: 1002,
        tokenID: 5,
        price: 85.42,
        imagePath: "assets/images/fishes/scary.png"));
  }
}
