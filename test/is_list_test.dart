import 'package:test/test.dart';
import 'package:validator/src/validator.dart';

void main() {
  group('A group of Alpha number rule tests', () {
    Validator validator;

    setUp(() {
      validator = Validator(onlyBooleanResult: true);
    });

    test('Test with aplha charater value', () {
      expect(validator.validate({'test': [1]}, {'test': 'is_list'}), true);
    });

    test('Test with numeric charater value', () {
      expect(validator.validate({'test': 1}, {'test': 'is_list'}), false);
    });

  });
}
