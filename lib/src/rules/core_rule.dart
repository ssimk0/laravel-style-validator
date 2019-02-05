import 'package:validator/src/exceptions/rule_configuration_exception.dart';

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

    throw RuleConfigurationException(
        'Rule support as value only string, List or number');
  }

  int parseIntOption(dynamic option) {
    if (!(option is int)) {
      option = int.tryParse(option) ?? null;

      if (option == null) {
        throw RuleConfigurationException(
            'Rule support only integer as a option');
      }
    }

    return option;
  }
}
