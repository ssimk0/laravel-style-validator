

class AlreadyExistException implements Exception {
  String cause;

  AlreadyExistException(this.cause);
}
