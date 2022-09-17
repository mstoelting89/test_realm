import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todo/controller/controller_bloc.dart';
import 'package:todo/presentation/routes/router.gr.dart';

import '../../../domain/entities/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;

  const TodoCard({Key? key, required this.todo}) : super(key: key);

  void _showDeleteDialog(
      {required BuildContext context, required ControllerBloc controllerBloc}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Selecte Todo to delete:"),
            content: Text(
              todo.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    controllerBloc.add(DeleteTodoEvent(todo: todo));
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
      onLongPress: () {
        final controllerBloc = context.read<ControllerBloc>();
        _showDeleteDialog(context: context, controllerBloc: controllerBloc);
      },
      onTap: () {
        AutoRouter.of(context).push(TodoDetailPageRoute(todo: todo));
      },
      child: Card(
        elevation: 16,
        color: todo.color.color,
        child: ListTile(
          leading: Checkbox(
            value: todo.done,
            onChanged: (value) {
              if (value != null) {
                BlocProvider.of<ControllerBloc>(context)
                    .add(UpdateTodoEvent(todo: todo, done: value));
              }
            },
          ),
          title: Text(
            todo.title,
            style: themeData.textTheme.headline1!
                .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
