import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todo/form/todo_form_bloc.dart';
import 'package:todo/domain/entities/todo_color.dart';

class ColorField extends StatelessWidget {
  final TodoColor todoColor;

  const ColorField({Key? key, required this.todoColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (context, index) {
            final itemColor = TodoColor.predefinedColors[index];

            return InkWell(
              onTap: () {
                BlocProvider.of<TodoFormBloc>(context).add(ColorChangedEvent(color: itemColor));
              },
              child: Material(
                color: itemColor,
                elevation: 10,
                shape: CircleBorder(
                  side: BorderSide(
                    width: 2,
                    color: itemColor == todoColor.color
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                child: const SizedBox(
                  height: 50,
                  width: 50,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10,);
          },
          itemCount: TodoColor.predefinedColors.length),
    );
  }
}
