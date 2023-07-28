import 'package:caixa_hackaton_app/app/shared/constants.dart';
import 'package:dio/dio.dart';

import '../model/usuario.dart';
import '../shared/api_client.dart';

class AuthRepository {
  late Dio _client;
  String? token;

  AuthRepository() {
    _client = ApiClient.build(baseRoute: Constants().kAuth);
  }

  Future<Response> auth(email, password) async {
    final response = await _client.post("/", data: {
      "email": email,
      "password": password,
    });
    return response;
  }

  Future<Response> signup(Usuario usuario) async {
    final response = await _client.post("/", data: usuario.toJson());
    return response;
  }
}
