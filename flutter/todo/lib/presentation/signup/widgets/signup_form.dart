import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/auth/signup_form/signup_form_bloc.dart';
import 'package:todo/core/failures/auth_failures.dart';
import 'package:todo/presentation/routes/router.gr.dart';
import 'package:todo/presentation/signup/widgets/signin_register_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String _email;
    late String _password;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String? validateEmail(String? input) {
      const emailRegex =
          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

      if (input == null || input.isEmpty) {
        return "Please enter Email";
      } else if (RegExp(emailRegex).hasMatch(input)) {
        _email = input;
        return null;
      } else {
        return "Invalid Email Format";
      }
    }

    String? validatePassword(String? input) {
      const emailRegex =
          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

      if (input == null || input.isEmpty) {
        return "Please enter Password";
      } else if (input.length >= 6) {
        _password = input;
        return null;
      } else {
        return "Password is too short";
      }
    }

    String mapFailureMessage(AuthFailure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return "Something went wrong!";
        case EmailAlreadyInUseFailure:
          return "Email already in use";
        case InvalidEmailAndPasswordCombinationFailure:
          return "Invalid Email and Password compination";
        default:
          return "Something went wrong!";
      }
    }

    final themeData = Theme.of(context);

    return BlocConsumer<SignupFormBloc, SignupFormState>(
      listenWhen: (previous, current) => previous.authFailureOrSuccessOption != current.authFailureOrSuccessOption,
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => {},
          (eitherFailureOrSuccess) => eitherFailureOrSuccess.fold(
            (failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    mapFailureMessage(failure),
                    style: themeData.textTheme.bodyText1,
                  ),
                  backgroundColor: Colors.redAccent,
                ),
              );
            },
            (_) {
              AutoRouter.of(context).replace(const HomePageRoute());
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showValidationMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                'Welcome',
                style: themeData.textTheme.headline1!.copyWith(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 4),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Plese register or sign in',
                style: themeData.textTheme.headline1!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 4),
              ),
              const SizedBox(
                height: 80,
              ),
              TextFormField(
                cursorColor: Colors.white,
                decoration: const InputDecoration(labelText: "E-Mail"),
                validator: validateEmail,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorColor: Colors.white,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
                validator: validatePassword,
              ),
              const SizedBox(
                height: 40,
              ),
              SignInRegisterButton(
                buttonText: "Sign in",
                callback: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<SignupFormBloc>(context).add(
                        SignInWithEmailAndPasswordPressed(
                            email: _email, password: _password));
                  } else {
                    BlocProvider.of<SignupFormBloc>(context).add(
                        SignInWithEmailAndPasswordPressed(
                            email: null, password: null));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Invalid input",
                          style: themeData.textTheme.bodyText1,
                        ),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SignInRegisterButton(
                buttonText: "Register",
                callback: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<SignupFormBloc>(context).add(
                        RegisterWithEmailAndPasswordPressed(
                            email: _email, password: _password));
                  } else {
                    BlocProvider.of<SignupFormBloc>(context).add(
                        RegisterWithEmailAndPasswordPressed(
                            email: null, password: null));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Invalid input",
                          style: themeData.textTheme.bodyText1,
                        ),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                },
              ),
              if (state.isSubmitting) ...[
                const SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  color: themeData.colorScheme.secondary,
                )
              ],
            ],
          ),
        );
      },
    );
  }
}
