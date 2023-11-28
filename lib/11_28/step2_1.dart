void main() {
  printMsg('Hell Dart!');

  int result = addNumbers(3, 5);
  print('3 + 5 = $result');

  showInfo('Allice');
  showInfo('Bob', age: 30);

  printInfo('Charlie', 35);
}

void printMsg(String message) {
  print(message);
}

int addNumbers(int a, int b) {
  return a + b;
}

void showInfo(String name, {int? age}) {
  print('Name: $name');
  if (age != null) {
    print('Age: $age');
  }
}

void printInfo(String name, int age) {
  print('Name: $name');
  print('Age: $age');
}
