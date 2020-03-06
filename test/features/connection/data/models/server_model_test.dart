import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/connection/data/models/server_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tServerModel = ServerModel(name: "Name", ip: "192.168.1.1", port: "12345", rconPort: "67890", password: "password");

  test('should be a subclass of Server entity', () async {
    expect(tServerModel, isA<ServerModel>());
  });

  group('fromJson', () {
    test('should return a valid model', () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('server.json'));
      //act
      final result = ServerModel.fromJson(jsonMap);
      //assert
      expect(result, tServerModel);
    });
  });

  group('toJson', () {
    test('should return a Json map containing the proper data', () {
      //arrange
      final result = tServerModel.toJson();
      final expectedMap = {
        "name": "Name",
        "ip": "192.168.1.1",
        "port": "12345",
        "rconPort": "67890",
        "password": "password",
      };
      //assert
      expect(result, expectedMap);
    });
  });
}
