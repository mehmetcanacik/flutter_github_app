import 'package:github_app/core/enums/http_enum.dart';

extension HttpExtension on HttpTypes {
  String get rawBuild {
    switch (this) {
      case HttpTypes.get:
        return "GET";
      case HttpTypes.post:
        return "POST";
      case HttpTypes.put:
        return "PUT";
      case HttpTypes.patch:
        return "PATCH";
      case HttpTypes.delete:
        return "DELETE";
      default:
        return 'Error Type';
    }
  }
}
