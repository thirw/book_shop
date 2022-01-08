class ApiErrorHandler implements Exception {
  final _message;
  final _prefix;

  ApiErrorHandler([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends ApiErrorHandler {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends ApiErrorHandler {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends ApiErrorHandler {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends ApiErrorHandler {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}