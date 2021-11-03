import 'dart:io';
import 'package:dio/dio.dart';
import '../base/base_model.dart';
import '../enums/http_enum.dart';
import '../extensions/http_extensions.dart';
import '../model/i_response_model.dart';
import '../model/response_model.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetchData<R, T extends BaseModel>(
      {required String path,
      required T parseModel,
      data,
      required HttpTypes type,
      Options? options});
}

class CoreDio with DioMixin, ICoreDio {
  @override
  Future<IResponseModel<R>> fetchData<R, T extends BaseModel>(
      {required String path,
      required T parseModel,
      data,
      required HttpTypes type,
      Options? options}) async {
    final responseBody = await request(
      path,
      data: data,
      options: Options(
          method: type.rawBuild,
          sendTimeout: 5000,
          receiveTimeout: 2000,
          responseType: ResponseType.json),
    );
    switch (responseBody.statusCode) {
      case HttpStatus.accepted:
      case HttpStatus.ok:
        final receivingData = _responseParser<R, T>(
            data: responseBody.data, parseModel: parseModel);
        return ResponseModel<R>(userData: receivingData);

      default:
        return ResponseModel(
            errorMessage:
                ErrorModel(error: "Bir sorun oluştu : ${responseBody.data}"));
    }
  }

  R _responseParser<R, T extends BaseModel>(
      {dynamic data, required T parseModel}) {
    if (data is List) {
      return data.map((user) => parseModel.fromJson(user)).toList().cast<T>()
          as R;
    } else if (data is Map<String, dynamic>) {
      return parseModel.fromJson(data) as R;
    }
    return data as R;
  }
}
