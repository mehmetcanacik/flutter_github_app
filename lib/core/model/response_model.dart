import 'package:github_app/core/base/base_model.dart';
import 'package:github_app/core/model/i_response_model.dart';

class ResponseModel<T> extends IResponseModel<T> {
  final T? userData;
  final IErrorModel? errorMessage;

  ResponseModel({this.userData, this.errorMessage})
      : super(data: userData, error: errorMessage);
}

class ErrorModel extends IErrorModel {
  final String? error;

  ErrorModel({this.error}) : super(message: error);
}
