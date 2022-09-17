import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/auth/authbloc/auth_bloc.dart';
import 'package:todo/application/todo/controller/controller_bloc.dart';
import 'package:todo/application/todo/observer/observer_bloc.dart';
import 'package:todo/core/failures/todo_failures.dart';
import 'package:todo/presentation/home/widgets/home_body.dart';
import 'package:todo/presentation/routes/router.gr.dart';
import '../../injection.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  String _mapFailureToMessage(TodoFailure todoFailure) {
    switch (todoFailure.runtimeType) {
      case InsufficientPermissons:
        return "Keine Berechtigung";
      case UnexpectedFailure:
        return "Something went wrong";
      default:
        return "Something went wrong";
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final observerBloc = sl<ObserverBloc>()..add(ObserveAllEvent());
    return MultiBlocProvider(
      providers: [
        BlocProvider<ObserverBloc>(create: (context) => observerBloc),
        BlocProvider<ControllerBloc>(create: (context) => sl<ControllerBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: (context, state) {
            if (state is AuthStateUnauthenticated) {
              AutoRouter.of(context).push(const SignUpPageRoute());
            }
          }),
          BlocListener<ControllerBloc, ControllerState>(
              listener: (context, state) {
            if (state is ControllerFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    _mapFailureToMessage(state.todoFailure),
                    style: themeData.textTheme.bodyText1,
                  ),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
          }),
        ],
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(SignOutPressedEvent());
              },
            ),
            title: const Text("ToDo"),
          ),
          body: const HomeBody(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: themeData.colorScheme.secondary,
            onPressed: () {
              AutoRouter.of(context).push(TodoDetailPageRoute(todo: null));
            },
            child: const Icon(Icons.add, size: 26,),
          ),
        ),
      ),
    );
  }
}
