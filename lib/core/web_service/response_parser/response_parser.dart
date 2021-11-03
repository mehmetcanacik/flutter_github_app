part of '../core_dio.dart';

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
