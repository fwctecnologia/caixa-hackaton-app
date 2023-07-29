import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/home_screen.dart';

class ContasCartoesScreen extends StatefulWidget {
  const ContasCartoesScreen({super.key});

  @override
  State<ContasCartoesScreen> createState() => _ContasCartoesScreenState();
}

class _ContasCartoesScreenState extends State<ContasCartoesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Container(
        margin: EdgeInsets.all(16),
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF55A0D6),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () async {
            Get.to(() => const HomeScreen());
          },
          child: Text(
            'Cadastre contas ou cartões',
            style: GoogleFonts.robotoCondensed(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Image.asset('assets/chevron_right.png'),
        actions: [
          Image.asset('assets/medal.png'),
          Container(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Minhas Contas',
              style: GoogleFonts.robotoCondensed(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: -1,
              ),
            ),
            Container(height: 10),
            card(
              'Conta Caixa Xovem',
              '728,34',
              'Ver movimentacoes',
            ),
            Container(height: 20),
            Text(
              'Meus Cartoes',
              style: GoogleFonts.robotoCondensed(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: -1,
              ),
            ),
            Container(height: 10),
            card(
              'Carta Caixa Xovem',
              '238,61',
              'Ver compras',
            ),
          ],
        ),
      ),
    );
  }
}

Widget card(title, value,description) {
  return Container(
    width: MediaQuery.of(Get.context!).size.width,
    padding: EdgeInsets.all(8).copyWith(left: 12,right: 12),
    decoration: BoxDecoration(
      color: Color(0xFF505050),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/caixa.png',
            ),
            Container(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: -1,
                  ),
                ),
                Text(
                  'R\$ ${value}',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: -1,
                  ),
                ),
              ],
            )
          ],
        ),
        Container(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              description,
              style: GoogleFonts.robotoCondensed(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: -1,
              ),
            ),
            Image.asset(
              'assets/chevron_right_small.png',
            ),
          ],
        )
      ],
    ),
  );
}
