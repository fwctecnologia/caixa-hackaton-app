import 'package:caixa_hackaton_app/app/modules/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    Image.asset(
                      'assets/girl_selfie.png',
                    ),
                    Container(height: 20),
                    Text(
                      'Escolha como criar sua conta!',
                      style: GoogleFonts.montserrat(
                        height: 0.8,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white
                      ),
                    ),
                    Text(
                      'Caixa JOVEM',
                      style: GoogleFonts.montserrat(
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Container(height: 40),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => RegisterScreen());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFF505050),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/mail.png',
                              width: 40,
                              height: 40,
                            ),
                            Container(width: 20),
                            Text(
                              "Criar com email e senha",
                              style: GoogleFonts.robotoCondensed(
                                fontSize: 18,
                                color: Color(0XFFBEBEBE),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 20),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => RegisterScreen());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFF505050),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/caixa.png',
                              width: 40,
                              height: 40,
                            ),
                            Container(width: 20),
                            Text(
                              "Usar minha conta caixa",
                              style: GoogleFonts.robotoCondensed(
                                fontSize: 18,
                                color: Color(0XFFBEBEBE),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: TextButton(
                    //     style: TextButton.styleFrom(
                    //       foregroundColor: Colors.blue,
                    //     ),
                    //     onPressed: () {},
                    //     child: Text(
                    //       'Esqueci minha senha',
                    //       style: GoogleFonts.montserrat(fontWeight: FontWeight.normal),
                    //     ),
                    //   ),
                    // ),
                    Expanded(child: Container()),
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 50,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Theme.of(context).colorScheme.primary,
                    //       foregroundColor: Colors.white,
                    //     ),
                    //     onPressed: () {
                    //       Get.to(() => RegisterScreen());
                    //     },
                    //     child: const Text('Entrar'),
                    //   ),
                    // ),
                    Container(height: 10),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => RegisterScreen());
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'já tem uma conta? ',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'Faça login',

                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
