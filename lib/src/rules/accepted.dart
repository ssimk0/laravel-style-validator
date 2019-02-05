
import 'package:validator/src/rules/rule.dart';

class Accepted implements Rule {

  final List<dynamic> acceptable = ['yes', 'on', '1', 1, true, 'true'];

  @override
  bool validate(value, options) {

    return acceptable.indexOf(value) > -1;
  }

}
