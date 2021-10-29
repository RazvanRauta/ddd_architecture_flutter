import 'package:dartz/dartz.dart';
import '../../core/failures.dart';
import '../../core/value_objects.dart';
import '../../core/value_validator.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory EmailAddress(String input) {
    return EmailAddress._(
      value: validateEmailAddress(input),
    );
  }

  const EmailAddress._({required this.value});
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory Password(String input) {
    return Password._(
      value: validatePassword(input),
    );
  }

  const Password._({required this.value});
}
