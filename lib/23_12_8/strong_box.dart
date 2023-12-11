enum KeyType {
  padlock(maxTryOpenCount: 1024),
  button(maxTryOpenCount: 10000),
  dial(maxTryOpenCount: 30000),
  finger(maxTryOpenCount: 1000000);

  final int maxTryOpenCount;

  const KeyType({
    required this.maxTryOpenCount,
  });
}

class StrongBox<E> {
  E? _instance;
  final KeyType _key;
  int _tryOpenCount = 0;

  StrongBox({
    required key,
    E? instance,
  })  : _instance = instance,
        _key = key;

  E? get(key) {
    if (key != _key) {
      print('올바른 키를 사용하세요.');
      return null;
    }

    _tryOpenCount++;
    print('$_tryOpenCount 번째 오픈 시도');

    return (_tryOpenCount < key.maxTryOpenCount ? null : _instance);
  }

  void put(E instance) {
    _instance = instance;
  }
}

class Treasure {}

void main() {
  KeyType padlockKey = KeyType.padlock;
  KeyType fingerKey = KeyType.finger;

  Treasure treasure = Treasure();
  StrongBox<Treasure> strongBox = StrongBox(key: padlockKey, instance: treasure);
  strongBox.put(treasure);

  // 다른 타입 키 사용
  final instance = strongBox.get(fingerKey);
  print(instance);

  // 맞는 키 사용
  for (var i = 1; i <= padlockKey.maxTryOpenCount; i++) {
    final instance = strongBox.get(padlockKey);
    print(instance ?? '더 시도하시오.');
  }
}
