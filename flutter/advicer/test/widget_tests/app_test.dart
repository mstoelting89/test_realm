import 'package:advicer/application/advicer/advicer_bloc.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/presentation/advicer/widgets/advice_page_body.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAdvicerBloc extends MockBloc<AdvicerEvent, AdvicerState>
    implements AdvicerBloc {}

class FakeAdvicerEvent extends Fake implements AdvicerEvent {}

class FakeAdvicerState extends Fake implements AdvicerState {}

class TestScaffoldWrapper extends StatelessWidget {
  final Widget child;

  const TestScaffoldWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: child,
    ));
  }
}

void main() {
  late MockAdvicerBloc mockAdvicerBloc;

  setUp(() {
    mockAdvicerBloc = MockAdvicerBloc();
  });

  group("Advice Page Body Test", () {
    setUpAll(() {
      registerFallbackValue(FakeAdvicerEvent());
      registerFallbackValue(FakeAdvicerState());
    });

    final findInitialText = find.byKey(AdvicePageBody.initTextKey);
    final findButton = find.byKey(AdvicePageBody.customButtonKey);
    final findErrorMessage = find.byKey(AdvicePageBody.errorFieldKey);
    final findProgressIndicator = find.byType(CircularProgressIndicator);
    final findAdvice = find.byKey(AdvicePageBody.advicerFieldKey);

    final tAdvice = AdviceEntity(id: 1, advice: "Test");

    testWidgets("advicer body should display inital message and button",
        (WidgetTester tester) async {
      // arrange -> define finders -> arrange bloc
      when(() => mockAdvicerBloc.state).thenReturn(AdvicerInitial());

      // act -> build/pump widget to test
      await tester.pumpWidget(
        TestScaffoldWrapper(
          child: BlocProvider<AdvicerBloc>(
            create: (context) => mockAdvicerBloc,
            child: const AdvicePageBody(),
          ),
        ),
      );

      // assert -> check widget
      expect(findButton, findsOneWidget);
      expect(findInitialText, findsOneWidget);
      expect(findErrorMessage, findsNothing);
    });

    testWidgets("advicer body should display loading state",
        (WidgetTester tester) async {
      // arrange -> define finders -> arrange bloc
      when(() => mockAdvicerBloc.state).thenReturn(AdvicerStateLoading());

      // act -> build/pump widget to test
      await tester.pumpWidget(
        TestScaffoldWrapper(
          child: BlocProvider<AdvicerBloc>(
            create: (context) => mockAdvicerBloc,
            child: const AdvicePageBody(),
          ),
        ),
      );

      // assert -> check widget
      expect(findButton, findsOneWidget);
      expect(findInitialText, findsNothing);
      expect(findErrorMessage, findsNothing);
      expect(findProgressIndicator, findsOneWidget);
    });

    testWidgets("advicer body should display error state",
        (WidgetTester tester) async {
      // arrange -> define finders -> arrange bloc
      when(() => mockAdvicerBloc.state)
          .thenReturn(AdvicerStateError(message: "error"));

      // act -> build/pump widget to test
      await tester.pumpWidget(
        TestScaffoldWrapper(
          child: BlocProvider<AdvicerBloc>(
            create: (context) => mockAdvicerBloc,
            child: const AdvicePageBody(),
          ),
        ),
      );

      // assert -> check widget
      expect(findButton, findsOneWidget);
      expect(findInitialText, findsNothing);
      expect(findErrorMessage, findsOneWidget);
      expect(findProgressIndicator, findsNothing);
    });

    testWidgets("advicer body should display loaded state",
            (WidgetTester tester) async {
          // arrange -> define finders -> arrange bloc
          when(() => mockAdvicerBloc.state)
              .thenReturn(AdvicerStateLoaded(advice: tAdvice.advice));

          // act -> build/pump widget to test
          await tester.pumpWidget(
            TestScaffoldWrapper(
              child: BlocProvider<AdvicerBloc>(
                create: (context) => mockAdvicerBloc,
                child: const AdvicePageBody(),
              ),
            ),
          );

          // assert -> check widget
          expect(findButton, findsOneWidget);
          expect(findInitialText, findsNothing);
          expect(findErrorMessage, findsNothing);
          expect(findProgressIndicator, findsNothing);
          expect(findAdvice, findsOneWidget);
        });
  });
}
