import 'package:caixa_hackaton_app/app/modules/conquistas/conquistas_screen.dart';
import 'package:caixa_hackaton_app/app/modules/contas_cartoes/contas_cartoes.dart';
import 'package:caixa_hackaton_app/app/modules/execucao_trilha/execucao_trilha.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TrilhasScreen extends StatefulWidget {
  const TrilhasScreen({super.key});

  @override
  State<TrilhasScreen> createState() => _TrilhasScreenState();
}

class _TrilhasScreenState extends State<TrilhasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset('assets/chevron_right.png'),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Get.to(() => ConquistasScreen());
              },
              child: Image.asset(
                'assets/medal_4.png',
                scale: 1.9,
              )),
          Container(width: 20),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aprendizado Financeiro',
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: -1),
                ),
                Container(height: 10),
                trilhaCard(
                  iconSrc: 'assets/presentation_icon.png',
                  title: 'Trilha de investimentos',
                  subtitle: 'Aprenda a fazer seu dinheiro render',
                ),
                Container(height: 20),
                trilhaCard(
                  iconSrc: 'assets/credit.png',
                  title: 'Trilha do credito',
                  subtitle: 'Aprenda sobre juros e financiamentos',
                ),
                Container(height: 20),
                trilhaCard(
                  iconSrc: 'assets/money.png',
                  title: 'Trilha do dinheiro',
                  subtitle: 'O básico sobre dinheiro e o mundo financeiro',
                ),
                Container(height: 20),
                trilhaCard(
                  iconSrc: 'assets/house.png',
                  title: 'Trilha da poupança',
                  subtitle: 'Aprenda a guardar seu dinheiro corretamente',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget trilhaCard({
  required String iconSrc,
  required String title,
  required String subtitle,
}) {
  return Container(
    padding: const EdgeInsets.all(10).copyWith(top: 15, bottom: 15),
    width: MediaQuery.of(Get.context!).size.width,
    decoration: BoxDecoration(
      color: const Color(0xFF505050),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Image.asset(
                  iconSrc,
                  width: 40,
                ),
                Container(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.robotoCondensed(
                            height: 1,
                            fontSize: 18,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Container(
                        child: Text(
                          subtitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 16,
                            letterSpacing: -1,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: MediaQuery.of(Get.context!).size.width,
                child: const LinearProgressIndicator(
                  minHeight: 10,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0XFF55A0D6),
                  ),
                  value: 0.5,
                ),
              ),
            ),
            Container(height: 10),
            SizedBox(
              height: 40,
              width: MediaQuery.of(Get.context!).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF55A0D6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Get.to(() => ExecucaoTrilhaScreen());
                },
                child: Text(
                  'Escolher',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: -1,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
