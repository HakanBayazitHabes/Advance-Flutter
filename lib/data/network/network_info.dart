import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementer implements NetworkInfo {
  final DataConnectionChecker _connectionChecker;

  NetworkInfoImplementer(this._connectionChecker);

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}