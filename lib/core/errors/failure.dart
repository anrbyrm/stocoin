import 'package:equatable/equatable.dart';

abstract class ValueFailure extends Equatable {}

class ShortInputFailure extends ValueFailure {
  @override
  List<Object?> get props => [];
}

class InvalidEmailFailure extends ValueFailure {
  @override
  List<Object?> get props => [];
}

class ShortPasswordFailure extends ValueFailure {
  @override
  List<Object?> get props => [];
}
