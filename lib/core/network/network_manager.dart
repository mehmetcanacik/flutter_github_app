import 'package:dio/dio.dart';
import 'package:github_app/core/web_service/core_dio.dart';

class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._getInternal();
  String? baseUrl;

  NetworkManager._getInternal();
  factory NetworkManager({String? url}) {
    _singleton.baseUrl = url ??= "https://jsonplaceholder.typicode.com/";
    final baseOptions = BaseOptions(
        baseUrl: _singleton.baseUrl!, receiveTimeout: 5000, sendTimeout: 2000);
    _singleton.coreDio = CoreDio(baseOptions: baseOptions);
    return _singleton;
  }

  late ICoreDio coreDio;
}
