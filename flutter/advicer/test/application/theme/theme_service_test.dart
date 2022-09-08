
import 'package:advicer/application/theme/theme_service.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/theme_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'theme_service_test.mocks.dart';

@GenerateMocks([ThemeRepository])
void main() {

  late MockThemeRepository mockThemeRepository;
  late ThemeService themeService;

  late int listenerCount;

  setUp(() {
    listenerCount = 0;
    mockThemeRepository = MockThemeRepository();
    themeService = ThemeServiceImpl(themeRepository: mockThemeRepository)..addListener(() {
      listenerCount += 1;
    });
  });

  test("check if default value for dark mode is true", () {
     // assert
    expect(themeService.isDarkModeOn, true);
  });

  group("setTheme", () {
    final t_mode = false;

    test("should set theme to the parameter it gets and store theme information", () async {
      // arrange
      themeService.isDarkModeOn = true;
      when(mockThemeRepository.setThemeMode(mode: anyNamed('mode'))).thenAnswer((_) async => true);

      // act
      await themeService.setTheme(mode: t_mode);

      // assert
      expect(themeService.isDarkModeOn, t_mode);
      verify(mockThemeRepository.setThemeMode(mode: t_mode));
      expect(listenerCount, 1);
    });
  });

  group("toggleTheme", () {
    final t_mode = false;

    test("should toggle current theme mode and store theme information", () async {
      // arrange
      themeService.isDarkModeOn = true;
      when(mockThemeRepository.setThemeMode(mode: anyNamed('mode'))).thenAnswer((_) async => true);

      // act
      await themeService.toggleTheme();

      // assert
      expect(themeService.isDarkModeOn, t_mode);
      verify(mockThemeRepository.setThemeMode(mode: t_mode));
      expect(listenerCount, 1);
    });
  });

  group("init", () {
    final t_mode = false;

    test("should get a themeMode from a local datasource and use it and notify listeners", () async {
      // arrange
      themeService.isDarkModeOn = true;
      when(mockThemeRepository.getThemeMode()).thenAnswer((_) async => Right(t_mode));

      // act
      await themeService.init();

      // assert
      expect(themeService.isDarkModeOn, t_mode);
      verify(mockThemeRepository.getThemeMode());
      expect(listenerCount, 1);
    });

    test("should start with darkmode if no theme is returned from local datasource and notify listeners", () async {
      // arrange
      themeService.isDarkModeOn = true;
      when(mockThemeRepository.getThemeMode()).thenAnswer((_) async => Left(CacheFailure()));

      // act
      await themeService.init();

      // assert
      expect(themeService.isDarkModeOn, true);
      verify(mockThemeRepository.getThemeMode());
      expect(listenerCount, 1);
    });
  });
}