class AuthException implements Exception{
  final String errormessage;
  final int? statusCode;
  AuthException(this.errormessage, {this.statusCode});

  @override
  String toString() {
    return "Api Exception : $errormessage";
  }
}