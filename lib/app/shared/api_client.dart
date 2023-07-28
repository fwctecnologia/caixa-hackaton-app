import 'package:dio/dio.dart';

class ApiClient {
  static Dio build({
    String? baseRoute,
    String? baseUrl = "http://192.168.171.17:3000",
  }) {
    final client = Dio(
      BaseOptions(
        receiveTimeout: const Duration(seconds: 10),
        receiveDataWhenStatusError: true,
        baseUrl: baseRoute != null ? baseUrl! + baseRoute : baseUrl!,
        responseType: ResponseType.json,
        contentType: 'application/json',
      ),
    );


    return client;
  }
}