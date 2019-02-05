import 'package:test/test.dart';
import 'package:validator/src/rules/min.dart';
import 'package:validator/src/validator.dart';
import 'package:validator/src/exceptions/rule_configuration_exception.dart';

void main() {
  group('A group of Accepterd rule tests', () {
    Validator validator;

    setUp(() {
      validator = Validator(onlyBooleanResult: true);
    });

    test('Test with number', () {
      expect(validator.validate({'test': 3}, {'test': 'min:2'}), true);
    });

    test('Test with List', () {
      expect(
          validator.validate({
            'test': [1, 2, 3]
          }, {
            'test': 'min:2'
          }),
          true);
    });

    test('Test with String', () {
      expect(
          validator.validate({'test': 'testString'}, {'test': 'min:2'}), true);
    });

    test('Negative test min rule with number', () {
      expect(validator.validate({'test': 1}, {'test': 'min:2'}), false);
    });

    test('Negative test with List', () {
      expect(
          validator.validate({
            'test': [1, 2]
          }, {
            'test': 'min:2'
          }),
          false);
    });

    test('Negative test with String', () {
      expect(validator.validate({'test': 'aa'}, {'test': 'min:2'}), false);
    });

    test('RuleConfigurationException with not valid option', () {
      try {
        validator.validate({'test': 'aa'}, {'test': 'min:notValid'});

        expect(false, true); // this should not be executed
      } on RuleConfigurationException catch (e) {
        expect(
            e.cause, 'Rule support only integer as a option');
      }
    });

    test('RuleConfigurationException with object as value', () {
      try {
        validator.validate({'test': Min()}, {'test': 'min:1'});

        expect(false, true); // this should not be executed
      } on RuleConfigurationException catch (e) {
        expect(
            e.cause, 'Rule support as value only string, List or number');
      }
    });
  });
}
