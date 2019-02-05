import 'package:validator/src/rules/core_rule.dart';
import 'package:validator/src/rules/rule.dart';

class Min extends CoreRule implements Rule {
  @override
  bool validate(dynamic value, dynamic min) {
    min = this.parseIntOption(min);

    int size = getSize(value);

    if (size != null) {
      return size > min;
    }
  }
}
