import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../core/failures/todo_failures.dart';
import '../../../domain/entities/todo.dart';
import '../../../domain/repositories/todo_respository.dart';

part 'observer_event.dart';
part 'observer_state.dart';

class ObserverBloc extends Bloc<ObserverEvent, ObserverState> {
  final TodoRepository todoRepository;

  StreamSubscription<Either<TodoFailure, List<Todo>>>? _streamSubscription;

  ObserverBloc({required this.todoRepository}) : super(ObserverInitial()) {
    on<ObserveAllEvent>((event, emit) async {
      emit(ObserverLoading());
      await _streamSubscription?.cancel();
      _streamSubscription = todoRepository.watchAll().listen((failureOrTodos) => add(TodosUpdatedEvent(failureOrTodo: failureOrTodos)));
    });

    on<TodosUpdatedEvent>((event, emit) {
      event.failureOrTodo.fold((failures) => emit(ObserverFailure(todoFailure: failures)), (todos) => emit(ObserverSuccess(todo: todos)));
    });
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}
