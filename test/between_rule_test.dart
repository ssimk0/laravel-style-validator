import 'package:test/test.dart';
import 'package:validator/src/rules/min.dart';
import 'package:validator/src/validator.dart';
import 'package:validator/src/exceptions/rule_configuration_exception.dart';
import 'package:validator/src/constants/errorMessages.dart';

void main() {
  group('A group of Between rule tests', () {
    Validator validator;

    setUp(() {
      validator = Validator(onlyBooleanResult: true);
    });

    test('Test with number', () {
      expect(validator.validate({'test': 3}, {'test': 'between:2,5'}), true);
    });

    test('Test with List', () {
      expect(
          validator.validate({
            'test': [1, 2, 3]
          }, {
            'test': 'between:2,5'
          }),
          true);
    });

    test('Test with String', () {
      expect(
          validator.validate({'test': 'test'}, {'test': 'between:2,5'}), true);
    });

    test('Negative test min rule with number', () {
      expect(validator.validate({'test': 1}, {'test': 'between:2,5'}), false);
    });

    test('Negative test with List', () {
      expect(
          validator.validate({
            'test': [1, 2]
          }, {
            'test': 'between:2,5'
          }),
          false);
    });

    test('Negative test with String', () {
      expect(validator.validate({'test': 'aa'}, {'test': 'between:2,5'}), false);
    });

    test('RuleConfigurationException with not valid option', () {
      try {
        validator.validate({'test': 'aa'}, {'test': 'between:2,notValid'});

        expect(false, true); // this should not be executed
      } on RuleConfigurationException catch (e) {
        expect(
            e.cause, ErrorMessages.PARSE_INT_OPTION);
      }
    });

    test('RuleConfigurationException with object as value', () {
      try {
        validator.validate({'test': Min()}, {'test': 'between:2,5'});

        expect(false, true); // this should not be executed
      } on RuleConfigurationException catch (e) {
        expect(
            e.cause,ErrorMessages.GET_SIZE_VALUE);
      }
    });

    test('RuleConfigurationException with no between options', () {
      try {
        validator.validate({'test': 1}, {'test': 'between'});

        expect(false, true); // this should not be executed
      } on RuleConfigurationException catch (e) {
        expect(
            e.cause, ErrorMessages.WRONG_CONFIGURATION);
      }

    });
  });
}
