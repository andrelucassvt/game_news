import 'package:game_news/app/util/error/failure.dart';

class ErrorConnection extends Failure {
  ErrorConnection({
    String? messageError = '',
    StackTrace? stackTrace,
  }) : super(
    message: messageError,
    stackTrace: stackTrace
  );
}

class ErrorGeneric extends Failure {
  ErrorGeneric({
    String? messageError = '',
    StackTrace? stackTrace,
  }) : super(
    message: messageError,
    stackTrace: stackTrace
  );
}

