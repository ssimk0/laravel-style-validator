import 'package:test/test.dart';
import 'package:validator/src/validator.dart';

void main() {
  group('A group of Accepted rule tests', () {
    Validator validator;

    setUp(() {
      validator = Validator(onlyBooleanResult: true);
    });

    test('Test with bool', () {
      expect(validator.validate({'test': true}, {'test': 'accepted'}), true);
    });

    test('Test with true as string', () {
      expect(validator.validate({'test': 'true'}, {'test': 'accepted'}), true);
    });

    test('Test with one as number', () {
      expect(validator.validate({'test': 1}, {'test': 'accepted'}), true);
    });

    test('Test with one as string', () {
      expect(validator.validate({'test': '1'}, {'test': 'accepted'}), true);
    });

    test('Test with yes string', () {
      expect(validator.validate({'test': 'yes'}, {'test': 'accepted'}), true);
    });

    test('Test with on string', () {
      expect(validator.validate({'test': 'on'}, {'test': 'accepted'}), true);
    });

    test('Test with on other string', () {
      expect(validator.validate({'test': 'off'}, {'test': 'accepted'}), false);
    });
  });
}
