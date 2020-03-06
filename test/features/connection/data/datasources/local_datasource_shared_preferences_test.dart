import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/errors/exceptions.dart';
import 'package:number_trivia/features/connection/data/data_sources/server_local_datasource.dart';
import 'package:number_trivia/features/connection/data/models/server_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  ServerLocalDataSourceSharedPreferences dataSource;
  MockSharedPreferences mockSharedPreferences;
  final tServerModel = ServerModel.fromJson(json.decode(fixture('server.json')));

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ServerLocalDataSourceSharedPreferences(sharedPreferences: mockSharedPreferences);

    final tServerModel = ServerModel.fromJson(json.decode(fixture('server.json')));
  });

  group('saveServer', () {
    test('should return ServerModel from SharedPreferences when it exists in cache', () async {
      //arrange
      when(mockSharedPreferences.getString(any)).thenReturn(fixture('server.json'));
      //act
      final result = await dataSource.getSavedServer(tServerModel.name);
      //assert
      verify(mockSharedPreferences.getString(CACHED_SERVER));
      expect(tServerModel, result);
    });

    test('should throw a cache exception when there is no cached value', () async {
      //arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      //act
      final call = dataSource.getSavedServer;
      //assert
      expect(() => call(tServerModel.name), throwsA(isInstanceOf<CacheException>()));
    });
  });
}
