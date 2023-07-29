import 'package:caixa_hackaton_app/app/model/usuario.dart';
import 'package:caixa_hackaton_app/app/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth_controller.dart';
import 'auth_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Usuario user = Usuario();
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 40),
                Image.asset(
                  'assets/girl_selfie.png',
                ),
                Container(height: 20),
                Text(
                  'Crie sua conta!',
                  style: GoogleFonts.robotoCondensed(
                      height: 0.8,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white),
                ),
                Container(height: 20),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Digite seu e-mail',
                    hintStyle: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0XFFBEBEBE)),
                    prefixIcon: Image.asset("assets/mail.png"),
                    suffixIcon: Container(width: 20),
                    isDense: true,
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 65, maxHeight: 35),
                    fillColor: Color(0xFF505050),
                    filled: true,
                  ),
                ),
                Container(height: 20),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Escolha uma senha',
                    isDense: true,
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 65, maxHeight: 35),
                    hintStyle: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0XFFBEBEBE)),
                    prefixIcon: Image.asset("assets/lock.png"),
                    suffixIcon: Container(width: 20),
                    fillColor: Color(0xFF505050),
                    filled: true,
                  ),
                ),
                Container(height: 20),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Repita a senha',
                    hintStyle: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0XFFBEBEBE)),
                    prefixIcon: Image.asset("assets/lock.png"),
                    suffixIcon: Container(width: 20),
                    isDense: true,
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 65, maxHeight: 35),
                    fillColor: Color(0xFF505050),
                    filled: true,
                  ),
                ),
                Container(height: 80),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF55A0D6),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      Get.to(() => const HomeScreen());
                    },
                    child: Text(
                      'Criar conta',
                      style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(height: 10),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => AuthScreen());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'já tem uma conta? ',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: 'Faça login',
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
