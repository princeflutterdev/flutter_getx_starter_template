enum ErrorType {
  /// It occurs when url is opened timeout.
  connectTimeout,

  /// It occurs when url is noConnection.
  noConnection,

  /// When the server response, but with a incorrect status, such as 404, 503...
  response,

  /// When the request is cancelled, dio will throw a error with this type.
  cancel,

  /// When the request is unauthorize.
  unauthorize,

  /// Default error type, Some other Error. In this case, you can
  /// use the ApiError.error if it is not null.
  unknownError,
}

/// ApiError describes the error info  when request failed.
class ApiError implements Exception {
  const ApiError({
    this.type = ErrorType.unknownError,
    this.error,
  });

  final ErrorType type;

  /// The original error/exception object; It's usually not null when `type`
  /// is ErrorType.DEFAULT
  final dynamic error;

  String get message => (error?.toString() ?? '');

  @override
  String toString() {
    var msg = '$type\nmessage: $message';
    return msg;
  }
}
