import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'export_library.dart';
part 'response_parser/response_parser.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetchData<R, T extends BaseModel>(
      {required String path,
      required T parseModel,
      data,
      required HttpTypes type,
      Options? options});
}

class CoreDio with DioMixin, ICoreDio {
  final BaseOptions baseOptions;
  CoreDio({required this.baseOptions}) {
    options = baseOptions;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

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
}
