abstract class UserFailure implements Exception {
  final String message;

  UserFailure(this.message);

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

class NotValidParams extends UserFailure {
  NotValidParams(String message) : super(message);
}

class DataSourceError extends UserFailure {
  DataSourceError(String message) : super(message);
}

class ReturnIsEmpty extends UserFailure {
  ReturnIsEmpty(String message) : super(message);
}

class RequestError extends UserFailure {
  RequestError(String message) : super(message);
}