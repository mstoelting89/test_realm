

import 'dart:convert';

import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/infrastructure/models/advice_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixtures_reader.dart';

void main() {
  final t_adviceModel = AdviceModel(id: 1, advice: "test");

  test("model should be subclass of advice-entity", () {
    expect(t_adviceModel, isA<AdviceEntity>());
  });

  group("fromJsonFactory", () {
    test("should return a valid model if the JSON advice is correct", () {
      // arrange
      final Map<String,dynamic> jsonMap = json.decode(fixture("advice.json"));

      // act
      final result = AdviceModel.fromJson(jsonMap);

      // assert
      expect(result, t_adviceModel);
    });
  });
}