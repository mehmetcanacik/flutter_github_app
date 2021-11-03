import 'package:flutter/material.dart';
import 'package:github_app/core/constants/http_constants.dart';
import 'package:github_app/core/network/network_manager.dart';
import 'package:github_app/core/web_service/core_dio.dart';

abstract class BaseViewModel {
  BuildContext? context;
  void setContext(BuildContext context);
  void setInit();
  ICoreDio coreDio = NetworkManager(url: HttpConstants.githubAddress).coreDio;
}
