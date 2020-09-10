class AppException implements Exception {
  final int _code;
  final String _message;
  final String _prefix;

  AppException([this._message, this._prefix, this._code]);

  String toString() {
    return "$_code: $_prefix$_message";
  }

  int get code => _code;
  String get message => _message;
  String get prefix => _prefix;
  
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ", 400);
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ", 400);
}

class UnauthorizedException extends AppException {
  UnauthorizedException([message]) : super(message, "Unauthorized: ", 401);
}

class NotFoundException extends AppException {
  NotFoundException([message]) : super(message, "Not found: ", 404);
}

class InternalServerException extends AppException {
  InternalServerException([message]) : super(message, "Internal Server Error: ", 500);
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, 'Oh no!', 20201);
}