import 'package:validator/src/rules/rule.dart';

/// Rule validate Alpha numeric characters as well as dash and underscore.
class AlphaDash implements Rule {
  RegExp regExp = new RegExp(r'^[a-zA-Z0-9_-]*$');

  @override
  bool validate(dynamic value, dynamic options) {
    return value is String && regExp.hasMatch(value);
  }
}
