void main() {
  final numString = '10.2';
  try {
    int num = int.parse(numString);
    print(num);
  } catch (e) {
    print(0);
  }
}
