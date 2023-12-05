class Hero {
  String name;
  int _hp;
  bool _isAlive = true;

  Hero({
    required this.name,
    int hp = 100,
  }) : _hp = hp {
    print('$name hero 탄생. 현재 hp는 $hp');
  }

  bool get isAlive => _isAlive;

  int get hp => _hp;

  set hp(int value) {
    if (value <= 0) {
      _hp = 0;
      _die();

      return;
    }
    _hp = value;
  }

  void _die() {
    print('$name 이 죽었다');
    _isAlive = false;
  }
}

class Slime {
  int hp = 50;
  final String suffix;

  Slime({
    required this.suffix,
  });

  int attack(Hero hero) {
    if (!hero.isAlive) {
      print('${hero.name}은 이미 죽었다!');

      return 0;
    }
    final int damage = 10;
    hero.hp -= damage;

    print('슬라임 $suffix이/가 공격했다');
    print('$damage의 데미지');
    return damage;
  }
}

class PoisonSlime extends Slime {
  int _poisonAttackCount = 5;

  PoisonSlime({
    required super.suffix,
  });

  int get poisonAttackCount => _poisonAttackCount;

  int _poisonAttack(Hero hero) {
    if (_poisonAttackCount <= 0) {
      print('poison count를 모두 소진했다');
      return 0;
    }

    print('추가로, 독 포자를 살포했다!');
    final int damage = hero.hp ~/ 5;
    hero.hp -= damage;
    print('$damage 가 추가로 발생했다.');

    _poisonAttackCount -= 1;
    print('남은 poison attack count : $poisonAttackCount');

    return damage;
  }

  @override
  int attack(Hero hero) {
    if (!hero.isAlive) {
      print('${hero.name}은 이미 죽었다!');

      return 0;
    }

    int baseAttackDamage = super.attack(hero);
    int poisonAttackDamage = _poisonAttack(hero);
    int totalDamage = baseAttackDamage + poisonAttackDamage;
    print('총 $totalDamage damage 가 발생했다.');
    print('${hero.name} hp: ${hero.hp}');

    return totalDamage;
  }
}

void main() {
  Hero hero = Hero(name: 'Gmin', hp: 300);
  PoisonSlime poisonSlime = PoisonSlime(suffix: 'A');

  // poison attack count test: 최대 5번, 6번째에는 "poison count를 모두 소진했다" 발생
  for (int i = 0; i <= 5; i++) {
    poisonSlime.attack(hero);
  }

  // 용사 죽이기
  do {
    poisonSlime.attack(hero);
  } while (hero.isAlive);

  // 죽으면 attack 을 안한다.
  poisonSlime.attack(hero);
}
