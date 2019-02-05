import 'package:validator/validator.dart';

main() {
  var validator = Validator();

  validator.validate({
    'firstName': 'John',
    'lastName': 'Smith'
  }, {
    'firstName': 'min:3',
    'lastName': 'min:3'
  });
}
