import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Server extends Equatable {
  final String name;
  final String ip;
  final String port;
  final String rconPort;
  final String password;

  Server({
    @required this.name,
    @required this.ip,
    @required this.port,
    @required this.rconPort,
    @required this.password,
  });
}
