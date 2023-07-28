import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/bank_image.png"),
              Container(height: 20),
              Text(
                "Quem tem grana,\ntá suave! 😎",
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoCondensed(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Organize e invista seu dinheiro de forma inteligente enquanto aprende tudo sobre o mercado financeiro",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF55A0D6),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    Get.to(() => AuthScreen());
                  },
                  child: Text(
                    'Começar agora',
                    style: GoogleFonts.robotoCondensed(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(height: 20),
              GestureDetector(
                onTap: () {
                  Get.to(() => AuthScreen());
                },
                child: Text(
                  'Fazer Login',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
