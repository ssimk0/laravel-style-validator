import 'package:validator/src/exceptions/rule_configuration_exception.dart';
import 'package:validator/src/constants/errorMessages.dart';

class CoreRule {
  int getSize(dynamic value) {
    if (value is int) {
      return value;
    }

    if (value is List) {
      return value.length;
    }

    if (value is String) {
      return value.toString().length;
    }

    throw RuleConfigurationException(ErrorMessages.GET_SIZE_VALUE);
  }

  int parseIntOption(dynamic option) {
    if (!(option is int)) {
      option = int.tryParse(option) ?? null;

      if (option == null) {
        throw RuleConfigurationException(ErrorMessages.PARSE_INT_OPTION);
      }
    }

    return option;
  }
}
