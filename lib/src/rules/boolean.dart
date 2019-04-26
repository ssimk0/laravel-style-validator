import 'package:validator/src/rules/rule.dart';

/// Rule validate entirely alphabetic characters.
class Boolean implements Rule {
    final List<dynamic> acceptable = [false, 0, '0', '1', 1, true];

  @override
  bool validate(dynamic value, dynamic options) {
      return acceptable.indexOf(value) > -1;
  }
}
