

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/application/auth/authbloc/auth_bloc.dart';
import 'package:todo/application/auth/signup_form/signup_form_bloc.dart';
import 'package:todo/application/todo/controller/controller_bloc.dart';
import 'package:todo/application/todo/form/todo_form_bloc.dart';
import 'package:todo/application/todo/observer/observer_bloc.dart';
import 'package:todo/domain/repositories/auth_repository.dart';
import 'package:todo/domain/repositories/todo_respository.dart';
import 'package:todo/infrastructure/repositories/auth_repository_impl.dart';
import 'package:todo/infrastructure/repositories/todo_repsoitory_impl.dart';

final sl = GetIt.I; // sl = service locator

Future<void> init() async {
  // State Management
  sl.registerFactory(() => SignupFormBloc(authRepository: sl()));
  sl.registerFactory(() => AuthBloc(authRepository: sl()));
  sl.registerFactory(() => ObserverBloc(todoRepository: sl()));
  sl.registerFactory(() => ControllerBloc(todoRepository: sl()));
  sl.registerFactory(() => TodoFormBloc(todoRepository: sl()));

  // Repos
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(firebaseAuth: sl()));
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(firestore: sl()));
  
  // extern
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);
  final firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestore);
}

