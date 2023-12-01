class Cleric {
  final int maxHp = 50;
  final int maxMp = 10;
  int hp = 50;
  int mp = 10;
  String name;

  Cleric(this.name);

  void selfAid() {
    if (mp < 5) {
      print("MP 가 부족합니다.");
      return;
    }
    mp -= 5;
    hp = maxHp;
  }
}

void main() {
  Cleric cleric = Cleric("Gmin");
  cleric.hp = 10;
  cleric.selfAid();
  print(cleric.hp);
  print(cleric.mp);
}
