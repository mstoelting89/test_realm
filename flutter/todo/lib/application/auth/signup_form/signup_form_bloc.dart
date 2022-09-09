import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/failures/auth_failures.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'signup_form_event.dart';

part 'signup_form_state.dart';

class SignupFormBloc extends Bloc<SignupFormEvent, SignupFormState> {
  final AuthRepository authRepository;

  SignupFormBloc({required this.authRepository})
      : super(SignupFormState(
            isSubmitting: false,
            showValidationMessages: false,
            authFailureOrSuccessOption: none())) {
    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      if (event.email == null || event.password == null) {
        //emit(SignupFormState(isSubmitting: false, showValidationMessages: true));
        emit(state.copyWith(isSubmitting: false, showValidationMessages: true));
      } else {
        //emit(SignupFormState(isSubmitting: true, showValidationMessages: false));
        emit(state.copyWith(isSubmitting: true, showValidationMessages: false));
        final failureOrSuccess =
            await authRepository.registerWithEmailAndPassword(
                email: event.email!, password: event.password!);

        emit(state.copyWith(isSubmitting: false, authFailureOrSuccessOption: optionOf(failureOrSuccess)));
      }
    });

    on<SignInWithEmailAndPasswordPressed>((event, emit) async {
      if (event.email == null || event.password == null) {
        //emit(SignupFormState(isSubmitting: false, showValidationMessages: true));
        emit(state.copyWith(isSubmitting: false, showValidationMessages: true));
      } else {
        //emit(SignupFormState(isSubmitting: true, showValidationMessages: false));
        emit(state.copyWith(isSubmitting: true, showValidationMessages: false));
        final failureOrSuccess =
            await authRepository.signInWithEmailAndPassword(
            email: event.email!, password: event.password!);

        emit(state.copyWith(isSubmitting: false, authFailureOrSuccessOption: optionOf(failureOrSuccess)));
      }
    });
  }
}
