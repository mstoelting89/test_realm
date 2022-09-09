part of 'signup_form_bloc.dart';

@immutable
abstract class SignupFormEvent {}

class RegisterWithEmailAndPasswordPressed extends SignupFormEvent {
  final String? email;
  final String? password;

  RegisterWithEmailAndPasswordPressed({required this.email, required this.password});
}

class SignInWithEmailAndPasswordPressed extends SignupFormEvent {
  final String? email;
  final String? password;

  SignInWithEmailAndPasswordPressed({required this.email, required this.password});
}