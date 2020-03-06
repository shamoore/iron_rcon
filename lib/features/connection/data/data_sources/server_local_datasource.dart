import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:number_trivia/core/errors/exceptions.dart';
import 'package:number_trivia/features/connection/data/models/server_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_SERVER = 'CACHED_SERVER';

abstract class ServerLocalDataSource {
  Future<ServerModel> getSavedServer(String server) {}
  Future<bool> saveServer(ServerModel server) {}
  Future<void> removeServer(String server) {}
}

class ServerLocalDataSourceSharedPreferences extends ServerLocalDataSource {
  final SharedPreferences sharedPreferences;

  ServerLocalDataSourceSharedPreferences({@required this.sharedPreferences}) {}

  @override
  Future<bool> saveServer(ServerModel server) {
    // TODO: implement saveServer
  }

  @override
  Future<ServerModel> getSavedServer(String server) {
    final jsonString = sharedPreferences.getString(CACHED_SERVER);
    if (jsonString != null) {
      return Future.value(ServerModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> removeServer(String server) {
    // TODO: implement removeServer
  }
}
