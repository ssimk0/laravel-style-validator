import 'package:validator/src/rules/rule.dart';

/// Rule validate Alpha numeric characters.
class AlphaNum implements Rule {
  RegExp regExp = new RegExp(r'^[a-zA-Z0-9]*$');

  @override
  bool validate(dynamic value, dynamic options) {
    return value is String && regExp.hasMatch(value);
  }
}
