part of 'signup_form_bloc.dart';

class SignupFormState {
  final bool isSubmitting;
  final bool showValidationMessages;
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  SignupFormState({required this.isSubmitting, required this.showValidationMessages, required this.authFailureOrSuccessOption});

  SignupFormState copyWith({
    bool? isSubmitting,
    bool? showValidationMessages,
    Option<Either<AuthFailure, Unit>>? authFailureOrSuccessOption
  }) {
    return SignupFormState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      showValidationMessages:
          showValidationMessages ?? this.showValidationMessages,
      authFailureOrSuccessOption:
        authFailureOrSuccessOption ?? this.authFailureOrSuccessOption,
    );
  }
}
