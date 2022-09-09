import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/auth/signup_form/signup_form_bloc.dart';
import 'package:todo/presentation/signup/widgets/signup_form.dart';

import '../../injection.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<SignupFormBloc>(),
        child: const SignUpForm(),
      ),
    );
  }
}
