import 'package:validator/src/rules/rule.dart';

class IsList implements Rule {

  @override
  bool validate(dynamic value, dynamic options) {
    return value is List;
  }
}
