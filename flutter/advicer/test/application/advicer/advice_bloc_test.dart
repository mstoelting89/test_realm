
import 'package:advicer/application/advicer/advicer_bloc.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/usecases/advicer_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_bloc_test.mocks.dart';

@GenerateMocks([AdvicerUsecases])
void main() {
  late AdvicerBloc advicerBloc;
  late MockAdvicerUsecases mockAdvicerUsecases;

  setUp(() {
    mockAdvicerUsecases = MockAdvicerUsecases();
    advicerBloc = AdvicerBloc(usecases: mockAdvicerUsecases);
  });

  test("Initstate should be AdvicerInitial", () {
    //assert
    expect(advicerBloc.state, equals(AdvicerInitial()));
  });

  group("AdvicerRequestedEvent", () {

    final t_Advice = AdviceEntity(id: 1, advice: "test");
    final t_Advice_String = "test";

    test("should call usecase if event is added", () async {
      // arrange
      when(mockAdvicerUsecases.getAdviceUsecase()).thenAnswer((_) async => Right(t_Advice));

      // act
      advicerBloc.add(AdvicerRequestedEvent());
      await untilCalled(mockAdvicerUsecases.getAdviceUsecase());

      // assert
      verify(mockAdvicerUsecases.getAdviceUsecase());
      verifyNoMoreInteractions(mockAdvicerUsecases);
    });

    test("should emmit loading the n the loaded state after even is added", () async {
      // arrange
      when(mockAdvicerUsecases.getAdviceUsecase()).thenAnswer((_) async => Right(t_Advice));

      // assert later
      final expected = [
        AdvicerStateLoading(),
        AdvicerStateLoaded(advice: t_Advice_String)
      ];

      expectLater(advicerBloc.stream, emitsInOrder(expected));

      // act
      advicerBloc.add(AdvicerRequestedEvent());

    });

    test("should emmit loading the n the error state after even is added -> Usecase fails -> Server Failure", () async {
      // arrange
      when(mockAdvicerUsecases.getAdviceUsecase()).thenAnswer((_) async => Left(ServerFailure()));

      // assert later
      final expected = [
        AdvicerStateLoading(),
        AdvicerStateError(message: SERVER_FAILURE_MESSAGE)
      ];

      expectLater(advicerBloc.stream, emitsInOrder(expected));

      // act
      advicerBloc.add(AdvicerRequestedEvent());

    });

    test("should emmit loading the n the error state after even is added -> Usecase fails -> General Failure", () async {
      // arrange
      when(mockAdvicerUsecases.getAdviceUsecase()).thenAnswer((_) async => Left(GeneralFailure()));

      // assert later
      final expected = [
        AdvicerStateLoading(),
        AdvicerStateError(message: GENERAL_FAILURE_MESSAGE)
      ];

      expectLater(advicerBloc.stream, emitsInOrder(expected));

      // act
      advicerBloc.add(AdvicerRequestedEvent());

    });

  });
}