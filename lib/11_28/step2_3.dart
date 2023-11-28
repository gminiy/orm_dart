class Calulator {
  int add(int a, int b) => a + b;
  int sub(int a, int b) => a - b;
  int mul(int a, int b) => a * b;
  double div(int a, int b) => a / b;
}

void main() {
  Calulator calculator = Calulator();

  int a = 5;
  int b = 2;

  print('$a + $b = ${calculator.add(a, b)}');
  print('$a - $b = ${calculator.sub(a, b)}');
  print('$a * $b = ${calculator.mul(a, b)}');
  print('$a / $b = ${calculator.div(a, b)}');
}
