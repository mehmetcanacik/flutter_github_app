import 'package:github_app/core/base/base_model.dart';

abstract class IErrorModel {
  final String? message;
  const IErrorModel({this.message});
}

abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;

  IResponseModel({this.data, this.error});
}
