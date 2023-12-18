import './is_even.dart';
import 'package:test/test.dart';

void main() {
  test('is even test', () {
    expect(isEven(2), true);
    expect(isEven(3), false);
  });
}