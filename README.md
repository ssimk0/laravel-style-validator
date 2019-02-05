[![Build Status](https://travis-ci.org/ssimk0/laravel-style-validator.svg?branch=master)](https://travis-ci.org/ssimk0/laravel-style-validator)

WIP: still work in progress on this library

A validation library in style of well known laravel validation for Dart developers.

## Usage

A simple usage example:

```dart
import 'package:validator/validator.dart';

main() {
  var validator = Validator(onlyBooleanResult: true);
  var valid = validator.validate({
    'firstName': 'John',
    'lastName': 'Smith'
  }, {
    'firstName': 'min:3|alpha',
    'lastName': 'min:3|alpha',
  });
  
  if (valid) {
    // Do something
  }
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/ssimk0/laravel-style-validator/issues
