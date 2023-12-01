import 'dart:math';

class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;
  int hp;
  int mp;
  String name;

  Cleric({
    required this.name,
    this.hp = maxHp,
    this.mp = maxMp,
  });

  void selfAid() {
    if (mp < 5) {
      print("MP 가 부족합니다.");
      return;
    }
    mp -= 5;
    hp = maxHp;
  }

  int pray(int sec) {
    if (sec == 0) {
      return 0;
    }
    int recoveryMp = sec + Random().nextInt(3);
    mp += recoveryMp;

    if (mp > maxMp) {
      recoveryMp = maxMp - mp;
      mp = maxMp;

      return recoveryMp;
    }

    return recoveryMp;
  }
}

void main() {
  Cleric cleric = Cleric(name: "gmin");
  cleric.hp = 10;
  cleric.selfAid();
  print(cleric.hp);
  print(cleric.mp);

  cleric.mp = 0;
  cleric.pray(3);
  print(cleric.mp);
}
