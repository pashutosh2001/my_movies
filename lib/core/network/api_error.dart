class ApiError implements Exception {
  final String? message;

  ApiError({this.message});

  @override
  String toString() {
    return message!;
  }
}

class FetchDataException extends ApiError {
  FetchDataException({super.message});
}

class BadRequestException extends ApiError {
  BadRequestException([message]) : super(message: message);
}

class UnauthorisedException extends ApiError {
  UnauthorisedException([message]) : super(message: message);
}

class InvalidInputException extends ApiError {
  InvalidInputException([String? message]) : super(message: message);
}
