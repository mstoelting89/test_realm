

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/application/auth/signup_form/signup_form_bloc.dart';
import 'package:todo/domain/repositories/auth_repository.dart';
import 'package:todo/infrastructure/repositories/auth_repository_impl.dart';

final sl = GetIt.I; // sl = service locator

Future<void> init() async {
  // State Management
  sl.registerFactory(() => SignupFormBloc(authRepository: sl()));

  // Repos
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(firebaseAuth: sl()));
  
  // extern
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);
}

