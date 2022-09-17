import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todo/form/todo_form_bloc.dart';
import 'package:todo/presentation/routes/router.gr.dart';
import 'package:todo/presentation/todo_detail/widgets/safe_progress_overlay.dart';
import 'package:todo/presentation/todo_detail/widgets/todo_form.dart';

import '../../core/failures/todo_failures.dart';
import '../../domain/entities/todo.dart';
import '../../injection.dart';

class TodoDetailPage extends StatelessWidget {
  final Todo? todo;

  const TodoDetailPage({Key? key, required this.todo}) : super(key: key);

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
    return BlocProvider(
      create: (context) =>
      sl<TodoFormBloc>()
        ..add(InitializeTodoDetailPage(todo: todo)),
      child: BlocConsumer<TodoFormBloc, TodoFormState>(
        listenWhen: (p, c) =>
        p.failureOrSuccessOption != c.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(() => {}, (eitherFailureOrSuccess) {
            eitherFailureOrSuccess.fold((failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    _mapFailureToMessage(failure),
                    style: themeData.textTheme.bodyText1,
                  ),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }, (_) {
              Navigator.of(context).popUntil((route) => route.settings.name == HomePageRoute.name);
            });
          });
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(todo == null ? "Create Todo" : "Edit Todo"),
            ),
            body: Stack(
              children: [
                const TodoForm(),
                SaveProgressOverlay(isSaving: state.isSaving)
              ],
            ),
          );
        },
      ),
    );
  }
}
