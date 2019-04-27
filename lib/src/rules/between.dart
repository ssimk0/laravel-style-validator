import 'package:validator/src/exceptions/rule_configuration_exception.dart';
import 'package:validator/src/rules/core_rule.dart';
import 'package:validator/src/rules/rule.dart';
import 'package:validator/src/constants/errorMessages.dart';

class Between extends CoreRule implements Rule {

  @override
  bool validate(dynamic value, dynamic options) {
    if (options == null) {
      throw RuleConfigurationException(ErrorMessages.WRONG_CONFIGURATION);
    }
    List<dynamic> minMax = options.split(',');

    if (minMax.length < 2) {
      throw RuleConfigurationException(ErrorMessages.WRONG_CONFIGURATION);
    }

    var min = this.parseIntOption(minMax[0]);
    var max = this.parseIntOption(minMax[1]);

    int size = getSize(value);

    if(size != null) {
      return size > min && size < max;
    }

    throw RuleConfigurationException(ErrorMessages.WRONG_CONFIGURATION);
  }
}
