import 'package:firebase_auth/firebase_auth.dart';

class FirebaseExceptions implements Exception {
  final String errormessage;
  String? statusCode;

  FirebaseExceptions({required this.errormessage, this.statusCode});

  @override
  String toString() {
    return "Firebase Exception Occurred: $errormessage";
  }
}

FirebaseExceptions convertToAuthExceptions(FirebaseAuthException exception) {
  switch (exception.code) {
    case 'invalid-email':
      return FirebaseExceptions(
        errormessage: "The email address is badly formatted.",
        statusCode: exception.code,
      );
    case 'user-disabled':
      return FirebaseExceptions(
        errormessage: "This user has been disabled.",
        statusCode: exception.code,
      );
    case 'user-not-found':
      return FirebaseExceptions(
        errormessage: "No account found for this email.",
        statusCode: exception.code,
      );
    case 'wrong-password':
    case 'invalid-credential':
      return FirebaseExceptions(
        errormessage: "Incorrect email or password.",
        statusCode: exception.code,
      );
    case 'email-already-in-use':
      return FirebaseExceptions(
        errormessage: "An account already exists with this email.",
        statusCode: exception.code,
      );
    case 'weak-password':
      return FirebaseExceptions(
        errormessage: "The password is too weak.",
        statusCode: exception.code,
      );
    case 'too-many-requests':
      return FirebaseExceptions(
        errormessage: "Too many attempts. Try again later.",
        statusCode: exception.code,
      );
    case 'network-request-failed':
      return FirebaseExceptions(
        errormessage: "Network error. Check your connection.",
        statusCode: exception.code,
      );
    default:
      return FirebaseExceptions(
        errormessage:
            exception.message ?? "An unknown authentication error occurred.",
        statusCode: exception.code,
      );
  }
}
