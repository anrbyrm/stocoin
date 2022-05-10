part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email,
    this.password,
    this.status,
  });

  final Email? email;
  final Password? password;
  final FormzStatus? status;

  factory LoginState.initial() => LoginState(
        email: Email.pure(),
        password: Password.pure(),
        status: FormzStatus.pure,
      );

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
  }) =>
      LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [email, password, status];
}
