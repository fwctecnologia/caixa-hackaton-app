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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    Text(
                      'Bem vindo ao',
                      style: GoogleFonts.montserrat(
                        height: 0.8,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'LC Bank',
                      style: GoogleFonts.montserrat(
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Container(height: 40),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'E-mail',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        fillColor: Colors.grey[100],
                        filled: true,
                      ),
                    ),
                    Container(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Senha',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        fillColor: Colors.grey[100],
                        filled: true,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Esqueci minha senha',
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Get.to(RegisterScreen());
                        },
                        child: const Text('Entrar'),
                      ),
                    ),
                    Container(height: 10),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterScreen();
                              },
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Não tem uma conta? ',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'Cadastre-se',
                                style: GoogleFonts.montserrat(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
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
