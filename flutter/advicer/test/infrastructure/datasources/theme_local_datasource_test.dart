

import 'package:advicer/infrastructure/datasources/theme_local_datasource.dart';
import 'package:advicer/infrastructure/exceptions/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_local_datasource_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late ThemeLocalDatasource themeLocalDatasource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    themeLocalDatasource = ThemeLocalDatasourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group("getCachedThemeData", () {
    final t_themeData = true;

    test("should return bool (themeData) if there is one in sharedPreferences", () async {

      // Arrange
      when(mockSharedPreferences.getBool(any)).thenReturn(t_themeData);

      // Act
      final result = await themeLocalDatasource.getCachedThemeData();

      // Assert
      verify(mockSharedPreferences.getBool(CACHED_THEME_MODE));
      expect(result, t_themeData);
    });

    test("should return a CacheException if there is no themeDate in sharedPreferences", () async {

      // Arrange
      when(mockSharedPreferences.getBool(any)).thenReturn(null);

      // Act
      final call = themeLocalDatasource.getCachedThemeData;

      // Assert
      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
    });
  });
  
  group("cacheThemeData", () {
    final t_themeData = true;

    test("should call sharedPreferences to cache themeMode", () {
      
      // Arrange
      when(mockSharedPreferences.setBool(any, any)).thenAnswer((_) async => true);
      
      // Act
      themeLocalDatasource.cacheThemeData(mode: t_themeData);

      // Assert
      verify(mockSharedPreferences.setBool(CACHED_THEME_MODE, t_themeData));
    });
  });
}

