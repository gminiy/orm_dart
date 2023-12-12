import 'package:collection/collection.dart';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  String toString() {
    return 'Trader{name: $name, city: $city}';
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  String toString() {
    return 'Transaction{trader: $trader, year: $year, value: $value}';
  }
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void main() {
  print('// 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오');
  transactions
      .where((r) => r.year == 2011)
      .sorted((a, b) => a.value.compareTo(b.value))
      .forEach((r) => print(r.trader.name));

  print('\n');
  print('// 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오');
  transactions.map((r) => r.trader.city).toSet().forEach((r) => print(r));

  print('\n');
  print('// 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오');
  transactions
      .where((r) => r.trader.city == "Cambridge")
      .sorted((a, b) => a.trader.name.compareTo(b.trader.name))
      .forEach((r) => print(r));

  print('\n');
  print('// 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오');
  transactions
      .map((r) => r.trader.name)
      .toSet()
      .sorted((a, b) => a.compareTo(b))
      .forEach((r) => print(r));

  print('\n');
  print('// 5. 밀라노에 거래자가 있는가?');
  final bool isTraderInMilan =
      transactions.any((r) => r.trader.city == 'Milan');
  print('밀라노에 거래자가 있나요? $isTraderInMilan');

  print('\n');
  print('// 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오');
  transactions
      .where((r) => r.trader.city == 'Cambridge')
      .forEach((r) => print(r));

  print('\n');
  print('// 7. 전체 트랜잭션 중 최대값은 얼마인가?');
  // fold를 쓰면 초기값을 설정할 수 있어서 transactions가 비어있을 때를 대응할 수 있다.
  final int maxValue = transactions.fold<int>(
      0,
      (maxValue, element) =>
          maxValue > element.value ? maxValue : element.value);
  print(maxValue);

  print('\n');
  print('// 8. 전체 트랜잭션 중 최소값은 얼마인가?');
  // min value는 초기값을 설정하기가 어려워서 isEmpty 를 통해 transaction이 비어있는 케이스를 대응한다.
  final int minValue = transactions.isEmpty ? 0 : transactions.fold<int>(
      transactions.first.value,
      (minValue, element) =>
          minValue < element.value ? minValue : element.value);
  print(minValue);
}
