import 'package:validator/src/exceptions/already_exist_exception.dart';
import 'package:validator/src/exceptions/rule_configuration_exception.dart';
import 'package:validator/src/rules/min.dart';
import 'package:validator/src/rules/rule.dart';
import 'package:validator/validator.dart';
import 'package:test/test.dart';

class TestRule implements Rule {
  @override
  bool validate(value, options) {
    return true;
  }
}

void main() {
  group('A group of Validator tests', () {
    Validator validator;

    setUp(() {
      validator = Validator(onlyBooleanResult: false);
    });

    test('Register rule with same name', () {
      try {
        validator.registerRule('min', new Min());
      } on AlreadyExistException catch (e) {
        expect(e.cause, 'Rule with same name already exist');
      }
    });

    test('Register rule', () {
      validator.registerRule('test', new TestRule());

      expect(
          validator.validate({'value': 'someString'}, {'value': 'test'}), true);
    });

    test('Run single rule validation', () {
      expect(validator.isValid('someString', 'min', 3), true);
    });

    test('Run validation with errors by value key', () {
      var result = validator.validate(
          {'value': 'someString', 'value2': 'test123'},
          {'value': 'alpha|min:3', 'value2': 'alpha|min:10'});

      expect(result.containsKey('value'), false);
      expect(result.containsKey('value2'), true);
      expect(result['value2'], ['alpha', 'min']);
    });

    test('Run validation with unexisting rule', () {
      try {
        validator
            .validate({'value': 'someString'}, {'value': 'someTypo|min:3'});
      } on RuleConfigurationException catch (e) {
        expect(e.cause, 'Rule someTypo doesn\'t exist');
      }
    });
  });
}
