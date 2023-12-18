import 'package:test/test.dart';
import './reverse_string.dart';

void main() {
  test('should return reversed string', () {
    final String input = 'reverse string';
    final String expected = 'gnirts esrever';

    expect(reverseString(input), expected);
  });
}