import 'package:validator/src/rules/core_rule.dart';
import 'package:validator/src/rules/rule.dart';

class Between extends CoreRule implements Rule {

  @override
  bool validate(dynamic value, dynamic options) {
    List<dynamic> minMax = options.split(',');
    var min = this.parseIntOption(minMax[0]);
    var max = this.parseIntOption(minMax[1]);


    int size = getSize(value);

    if(size != null) {
      return size > min && size < max;
    }
  }
}
