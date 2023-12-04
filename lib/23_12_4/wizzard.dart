class Wand {
  String name;
  double power;

  Wand({
    required this.name,
    required this.power,
  });
}

class Wizard {
  String name;
  int hp;
  Wand? wand;

  Wizard({
    required this.name,
    required this.hp,
    this.wand,
  });
}