import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/advicer_repository.dart';
import 'package:advicer/domain/usecases/advicer_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advicer_usecases_test.mocks.dart';

@GenerateMocks([AdvicerRepository])
void main() {
  late AdvicerUsecases advicerUsecases;
  late MockAdvicerRepository mockAdvicerRepository;

  setUp(() {
    mockAdvicerRepository = MockAdvicerRepository();
    advicerUsecases = AdvicerUsecases(advicerRepository: mockAdvicerRepository);
  });

  group("getAdviceUsecase", () {
    final t_Advice = AdviceEntity(id: 1, advice: "Test");

    test("should the same advice as repo", () async {

      // arrange
      when(mockAdvicerRepository.getAdviceFromApi())
          .thenAnswer((_) async => Right(t_Advice));

      // act
      final result = await advicerUsecases.getAdviceUsecase();

      // assert
      expect(result, Right(t_Advice));
      verify(mockAdvicerRepository.getAdviceFromApi()); // ist die Funktion aufgerufen worden?
      verifyNoMoreInteractions(mockAdvicerRepository); // ist danach das Repository nicht nocheinmal gecalled worder?
    });

    test("should the same server failure as repo", () async {

      // hierfür nutzen wir equatable in der failures.dart, um zwei Objekte miteinander zu vergleichen

      // arrange -> Wir arrangieren ein Szenario
      when(mockAdvicerRepository.getAdviceFromApi())
          .thenAnswer((_) async => Left(ServerFailure()));

      // act -> Ausführung des Testobjektes
      final result = await advicerUsecases.getAdviceUsecase();

      // assert -> Vergleich
      expect(result, Left(ServerFailure()));
      verify(mockAdvicerRepository.getAdviceFromApi()); // ist die Funktion aufgerufen worden?
      verifyNoMoreInteractions(mockAdvicerRepository); // ist danach das Repository nicht nocheinmal gecalled worden?
    });

    test("should the same general failure as repo", () async {

      // hierfür nutzen wir equatable in der failures.dart, um zwei Objekte miteinander zu vergleichen

      // arrange -> Wir arrangieren ein Szenario
      when(mockAdvicerRepository.getAdviceFromApi())
          .thenAnswer((_) async => Left(GeneralFailure()));

      // act -> Ausführung des Testobjektes
      final result = await advicerUsecases.getAdviceUsecase();

      // assert -> Vergleich
      expect(result, Left(GeneralFailure()));
      verify(mockAdvicerRepository.getAdviceFromApi()); // ist die Funktion aufgerufen worden?
      verifyNoMoreInteractions(mockAdvicerRepository); // ist danach das Repository nicht nocheinmal gecalled worden?
    });
  });
}
