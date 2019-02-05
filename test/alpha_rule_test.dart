import 'package:test/test.dart';
import 'package:validator/src/validator.dart';

void main() {
  group('A group of Alpha rule tests', () {
    Validator validator;

    setUp(() {
      validator = Validator(onlyBooleanResult: true);
    });

    test('Test with aplha charater value', () {
      expect(validator.validate({'test': 'aplhatest'}, {'test': 'alpha'}), true);
    });

    test('Test with numeric charater value', () {
      expect(validator.validate({'test': 'aplhatest1'}, {'test': 'alpha'}), false);
    });

    test('Test with dash charater value', () {
      expect(validator.validate({'test': 'aplha_test'}, {'test': 'alpha'}), false);
    });

    test('Test with special charater value', () {
      expect(validator.validate({'test': 'aplha%test'}, {'test': 'alpha'}), false);
    });

  });
}
