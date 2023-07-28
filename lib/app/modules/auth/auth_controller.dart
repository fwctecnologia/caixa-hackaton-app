import 'package:caixa_hackaton_app/app/model/usuario.dart';
import 'package:caixa_hackaton_app/app/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AuthController {
  AuthRepository _authRepository = AuthRepository();

  Future<Usuario> login(String email, String password) async {
    try {
      final response = await _authRepository.auth(email, password);
      final u = Usuario.fromJson(response.data);
      return u;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Usuario> signup(Usuario usuario) async {
    try {
      final response = await _authRepository.signup(usuario);
      final u = Usuario.fromJson(response.data);
      Get.showSnackbar(const GetSnackBar(
        message: "Massa! Cadastro realizado com sucesso",
        duration: Duration(seconds: 3),
      ));
      return u;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
