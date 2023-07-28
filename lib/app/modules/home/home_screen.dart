import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Container(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('assets/drawer.png'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              "Olá, Xovem Novin",
              style: GoogleFonts.robotoCondensed(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            const ResumoSaldoWidget(),
            const SizedBox(height: 15),
            const PassosWidget(),
            const SizedBox(height: 15),
            const AssuntosWidget(),
            const SizedBox(height: 15),
            const SalaDoTesouro(),
          ],
        ),
      ),
    );
  }
}

class ResumoSaldoWidget extends StatelessWidget {
  const ResumoSaldoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: const BoxDecoration(
        color: Color(0xFF505050),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 10,
                      margin: const EdgeInsets.only(
                        top: 9,
                        bottom: 9,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF55A0D6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Saldo Geral",
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            height: 19 / 16,
                            color: const Color(0xffdedede),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "R\$ 0,00",
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            height: 23 / 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Meta atual",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        height: 19 / 16,
                        color: const Color(0xffdedede),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Definir meta",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        height: 23 / 20,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Minhas contas e cartões",
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 21 / 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  ">>",
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 21 / 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PassosWidget extends StatelessWidget {
  const PassosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: const BoxDecoration(
        color: Color(0xFF505050),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "assets/verified.png",
                  scale: 1.3,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Primeiros passos",
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 21 / 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "1 de 6 tarefas concluídas",
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 19 / 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                value: 0.3,
                minHeight: 12,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF55A0D6)),
                backgroundColor: Color(0xffE8F3EE),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(360, 46),
              backgroundColor: const Color(0xff55A0D6),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Continuar",
              style: GoogleFonts.robotoCondensed(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AssuntosWidget extends StatelessWidget {
  const AssuntosWidget({super.key});

  Widget buildButton({
    required String label,
    required String iconName,
    double scale = 1,
  }) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xff505050),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/$iconName.png",
                scale: scale,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: GoogleFonts.robotoCondensed(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 19 / 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Assuntos para aprender",
            style: GoogleFonts.robotoCondensed(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              height: 21 / 18,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 95,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildButton(
                  label: "Investimentos",
                  iconName: "investimentos",
                ),
                const SizedBox(width: 15),
                buildButton(
                  label: "Crédito",
                  iconName: "credito",
                  scale: 0.9,
                ),
                const SizedBox(width: 15),
                buildButton(
                  label: "Dinheiro",
                  iconName: "dinheiro",
                  scale: 1.4,
                ),
                const SizedBox(width: 15),
                buildButton(
                  label: "Poupança",
                  iconName: "poupanca",
                ),
                const SizedBox(width: 15),
                buildButton(
                  label: "Previdência",
                  iconName: "previdencia",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SalaDoTesouro extends StatelessWidget {
  const SalaDoTesouro({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sala do tesouro",
            style: GoogleFonts.robotoCondensed(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              height: 21 / 18,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Graninhas: 1",
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
