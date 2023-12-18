import './find_max.dart';
import 'package:test/test.dart';

void main() {
  test('should return max num from the random num list', () {
    expect(findMax([0.1, 0.3, 0.2, 0.8, 5, 1, 4.3]), 5);
  });
}