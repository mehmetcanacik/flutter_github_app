import 'package:dio/dio.dart';
import 'package:github_app/core/web_service/core_dio.dart';

class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._getInternal();
  String? baseUrl;

  NetworkManager._getInternal() {
    final baseOptions =
        BaseOptions(baseUrl: baseUrl!, receiveTimeout: 5000, sendTimeout: 2000);
    coreDio = CoreDio(baseOptions: baseOptions);
  }
  factory NetworkManager({String? url}) {
    _singleton.baseUrl = url ??= "https://jsonplaceholder.typicode.com/";
    return _singleton;
  }

  late ICoreDio coreDio;
}
