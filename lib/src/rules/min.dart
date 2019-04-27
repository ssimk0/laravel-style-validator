import 'package:validator/src/exceptions/rule_configuration_exception.dart';
import 'package:validator/src/rules/core_rule.dart';
import 'package:validator/src/rules/rule.dart';
import 'package:validator/src/constants/errorMessages.dart';

class Min extends CoreRule implements Rule {
  @override
  bool validate(dynamic value, dynamic min) {
    if (min == null) {
      throw RuleConfigurationException(ErrorMessages.WRONG_CONFIGURATION);
    }

    min = this.parseIntOption(min);

    int size = getSize(value);

    if (size != null) {
      return size > min;
    }
  }
}
