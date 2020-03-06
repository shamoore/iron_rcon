import 'package:meta/meta.dart';
import 'package:number_trivia/features/connection/domain/entities/server.dart';

class ServerModel extends Server {
  ServerModel({
    @required String name,
    @required String ip,
    @required String port,
    @required String rconPort,
    @required String password,
  }) : super(name: name, ip: ip, port: port, rconPort: rconPort, password: password);

  factory ServerModel.fromJson(Map<String, dynamic> json) {
    ServerModel model = ServerModel(name: json['name'], ip: json['ip'], port: json['port'], rconPort: json['rconPort'], password: json['password']);
    return model;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "ip": ip,
      "port": port,
      "rconPort": rconPort,
      "password": password,
    };
  }
}
