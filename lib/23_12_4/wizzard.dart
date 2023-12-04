bool checkName(String name) => name.length >= 3;

bool checkWandPower(double power) => power >= 0.5 && power <= 100;

bool checkWizardMp(int mp) => mp >= 0;

class Wand {
  String _name;
  double _power;

  Wand({
    required String name,
    required double power,
  })  : _name = name,
        _power = power,
        assert(checkName(name), 'wand 이름은 3 글자 이상이어야 합니다.'),
        assert(checkWandPower(power), 'wand power는 0.5 이상 100.0 이하이어야 합니다.');

  String get name => _name;

  set name(String name) {
    if (!checkName(name)) {
      throw Exception('wand 이름은 3 글자 이상이어야 합니다.');
    }
    _name = name;
  }

  double get power => _power;

  set power(double power) {
    if (!checkWandPower(power)) {
      throw Exception('wand power는 0.5 이상 100.0 이하이어야 합니다.');
    }

    _power = power;
  }
}

class Wizard {
  String _name;
  int _hp;
  int _mp;
  final Wand _wand;

  Wizard({
    required name,
    required int hp,
    required int mp,
    required Wand wand,
  })  : _name = name,
        _hp = hp = hp < 0 ? 0 : hp,
        _mp = mp,
        _wand = wand,
        assert(checkName(name), 'wizard 이름은 3 글자 이상이어야 합니다.'),
        assert(checkWizardMp(mp), 'wizard mp 는 0 이상이어야 합니다.');

  String get name => _name;

  set name(String value) {
    if (checkName(name)) {
      throw Exception('이름은 3 글자 이상이어야 합니다.');
    }

    _name = value;
  }

  int get hp => _hp;

  set hp(int value) {
    if (hp < 0) {
      print('hp가 0으로 설정 됩니다.');
      _hp = 0;
      return;
    }

    _hp = value;
  }

  int get mp => _mp;

  set mp(int value) {
    if (checkWizardMp(mp)) {
      throw Exception('wizard mp 는 0 이상이어야 합니다.');
    }
    _mp = value;
  }

  Wand get wand => _wand;

  set wand(Wand wand) {
    wand = _wand;
  }
}

void main() {
  Wand wand = Wand(name: 'myWand', power: 0.7);
  print('wand name: ${wand.name}, wand power: ${wand.power}');
  Wizard wizard = Wizard(name: 'gmin', hp: 10, mp: 1, wand: wand);
  print(
      'wizard name: ${wizard.name}, wizard hp: ${wizard.hp}, wizard mp: ${wizard.mp}, wand name: ${wizard.wand.name}, wand power: ${wizard.wand.power}');
  print("changing wizard's wand power...");
  wand.power = 10;
  print(
      'wizard name: ${wizard.name}, wizard hp: ${wizard.hp}, wizard mp: ${wizard.mp}, wand name: ${wizard.wand.name}, wand power: ${wizard.wand.power}');
}
