import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todo/form/todo_form_bloc.dart';
import 'package:todo/presentation/core/custom_button.dart';
import 'package:todo/presentation/todo_detail/widgets/color_field.dart';

class TodoForm extends StatelessWidget {
  const TodoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final textEditingControllerTitle = TextEditingController();
    final textEditingControllerBody = TextEditingController();

    late String body;
    late String title;

    String? validateBody(String? input) {
      if (input == null || input.isEmpty) {
        return "please enter a description";
      } else if (input.length < 300) {
        body = input;
        return null;
      } else {
        return "body too long";
      }
    }

    String? validateTitle(String? input) {
      if (input == null || input.isEmpty) {
        return "please enter a title";
      } else if (input.length < 30) {
        title = input;
        return null;
      } else {
        return "title too long";
      }
    }

    return BlocConsumer<TodoFormBloc, TodoFormState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        textEditingControllerTitle.text = state.todo.title;
        textEditingControllerBody.text = state.todo.body;
      },
      builder: (context, state) {
        final themeData = Theme.of(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Form(
            key: formKey,
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: ListView(
              children: [
                TextFormField(
                  controller: textEditingControllerTitle,
                  cursorColor: Colors.white,
                  maxLength: 100,
                  maxLines: 2,
                  minLines: 1,
                  validator: validateTitle,
                  decoration: InputDecoration(
                    label: const Text("Titel"),
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: textEditingControllerBody,
                  cursorColor: Colors.white,
                  maxLength: 300,
                  maxLines: 8,
                  minLines: 5,
                  validator: validateBody,
                  decoration: InputDecoration(
                    label: const Text("Body"),
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ColorField(todoColor: state.todo.color),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(buttonText: "Safe", callback: () {

                  if(formKey.currentState!.validate()) {
                    BlocProvider.of<TodoFormBloc>(context).add(SafePressedEvent(title: title, body: body));
                  } else {
                    BlocProvider.of<TodoFormBloc>(context).add(SafePressedEvent(title: null, body: null));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Invalid Input",
                          style: themeData.textTheme.bodyText1,
                        ),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
