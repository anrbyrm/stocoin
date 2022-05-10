import 'package:stocoin/core/errors/failure.dart';
import 'package:stocoin/core/models/value_object.dart';

class Email extends ValueObject<String> {
  Email.dirty(String? value) : super.dirty(value!);
  Email.pure() : super.pure('');

  @override
  ValueFailure? validator(String? value) {
    return RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    ).hasMatch(value!)
        ? null
        : InvalidEmailFailure();
  }
}

class Password extends ValueObject<String> {
  Password.dirty(String? value) : super.dirty(value!);
  Password.pure() : super.pure('');

  @override
  ValueFailure? validator(String? value) {
    return value!.length > 5 ? null : ShortInputFailure();
  }
}
