import 'package:validator/src/rules/accepted.dart';
import 'package:validator/src/rules/min.dart';
import 'package:validator/src/rules/rule.dart';
import 'package:validator/src/rules/alpha.dart';
import 'package:validator/src/rules/alpha_dash.dart';
import 'package:validator/src/rules/between.dart';
import 'package:validator/src/rules/alpha_num.dart';
import 'package:validator/src/rules/is_list.dart';
import 'package:validator/src/exceptions/already_exist_exception.dart';
import 'package:validator/src/exceptions/rule_configuration_exception.dart';

class Validator {
  Map<String, Rule> _rules = {
    'min': Min(),
    'accepted': Accepted(),
    'alpha': Alpha(),
    'alpha_dash': AlphaDash(),
    'alpha_num': AlphaNum(),
    'is_list': IsList(),
    'between': Between()
  };

  bool _onlyBooleanResult;

  Validator({onlyBooleanResult: false}) {
    this._onlyBooleanResult = onlyBooleanResult;
  }

  validate(Map<String, dynamic> subject, Map<String, String> rulesForValue) {
    Map<String, List<String>> errors = {};

    for (String valueName in rulesForValue.keys) {
      String validationRules = rulesForValue[valueName];
      List<String> rules = validationRules.split("|");
      for (String rule in rules) {
        List<String> ruleParsed = rule.split(":");

        var ruleOptions = ruleParsed.length > 1 ? ruleParsed[1] : null;
        var value = subject[valueName];
        var validationRule = _rules[ruleParsed[0]];
        if (validationRule == null) {
          return RuleConfigurationException('Rule ${ruleParsed[0]} doesn\'t exist');
        }

        bool valid = validationRule.validate(value, ruleOptions);

        if (!valid) {
          errors[valueName] =
              errors[valueName] != null ? errors[valueName] : [];
          errors[valueName].add(ruleParsed[0]);

          if (this._onlyBooleanResult) {
            break;
          }
        }
      }

      if (this._onlyBooleanResult && errors.isNotEmpty) {
        break;
      }
    }

    return errors.isEmpty ? true : this._onlyBooleanResult ? false : errors;
  }

  bool isValid(value, String ruleName, options) {
    return _rules[ruleName].validate(value, options);
  }

  void registerRule(String name, Rule rule) {
    if (this._rules[name] != null) {
      throw AlreadyExistException('Rule with same name already exist');
    }

    _rules[name] = rule;
  }
}
