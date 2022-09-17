part of 'observer_bloc.dart';

@immutable
abstract class ObserverEvent {}

class ObserveAllEvent extends ObserverEvent {}

class TodosUpdatedEvent extends ObserverEvent {
  final Either<TodoFailure, List<Todo>> failureOrTodo;

  TodosUpdatedEvent({
    required this.failureOrTodo,
  });
}