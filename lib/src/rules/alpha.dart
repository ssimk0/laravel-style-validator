import 'package:validator/src/rules/rule.dart';

/// Rule validate entirely alphabetic characters.
class Alpha implements Rule {
  RegExp regExp = new RegExp(r'^[a-zA-Z]*$');

  @override
  bool validate(dynamic value, dynamic options) {
    return value is String && regExp.hasMatch(value);
  }
}
