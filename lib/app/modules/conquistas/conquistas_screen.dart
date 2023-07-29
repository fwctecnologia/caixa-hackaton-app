import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ConquistasScreen extends StatefulWidget {
  const ConquistasScreen({super.key});

  @override
  State<ConquistasScreen> createState() => _ConquistasScreenState();
}

class _ConquistasScreenState extends State<ConquistasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset('assets/chevron_left.png'),
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
        title: const Text(
          'Nivel Atual',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 20),
            Image.asset(
              'assets/medal_4.png',
              width: 94,
              height: 94,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: MediaQuery.of(Get.context!).size.width,
                  child: const LinearProgressIndicator(
                    minHeight: 15,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0XFF55A0D6),
                    ),
                    value: 0.3,
                  ),
                ),
              ),
            ),
            Container(height: 10),
            const Text(
              'Você precisa de 85XP para chegar ao nível 5',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Container(height: 50),
            const Text(
              'Minhas Conquistas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white, letterSpacing: -1),
            ),
            Container(height: 20),
            card('Investidor Iniciante', 'Faça seu primeiro investimento', '50', 'Conquistado em 29/07/2023 às 13:05',
                'assets/chart.png'),
            Container(height: 10),
            card('Aprendedor Nato', 'Termine sua primeira trilha de aprendizado', '40',
                'Conquistado em 28/07/2023 às 14:12', 'assets/graduacao.png'),
            Container(height: 10),
            card('Um bom começo', 'Concluiu os primeiros passos', '60', 'Conquistado em 27/07/2023 às 19:56',
                'assets/verificado.png'),
          ],
        ),
      ),
    );
  }
}

Widget card(titulo, descricao, pontuacao, infoConquista, imgSrc) {
  return Container(
    width: MediaQuery.of(Get.context!).size.width,
    padding: EdgeInsets.all(12).copyWith(left: 12, right: 12),
    decoration: BoxDecoration(
      color: Color(0xFF505050),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imgSrc,
              height: 35,
            ),
            Container(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 18,
                    height: 0.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: -1,
                  ),
                ),
                Container(height: 5),
                SizedBox(
                  width: MediaQuery.of(Get.context!).size.width * 0.65,
                  child: Text(
                    descricao,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: -0.33,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              '+${pontuacao.toString()}',
              style: GoogleFonts.robotoCondensed(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0XFF55A0D6),
              ),
            ),
          ],
        ),
        Container(height: 5),
        Divider(
          color: Colors.white.withOpacity(0.5),
          height: 0.2,
          thickness: 0.2,
        ),
        Container(height: 5),
        Text(
          infoConquista,
          style: GoogleFonts.robotoCondensed(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: -0.33,
          ),
        ),
      ],
    ),
  );
}
