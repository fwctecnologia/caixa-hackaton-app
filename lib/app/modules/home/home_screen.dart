import 'package:caixa_hackaton_app/app/modules/lancamento/lancamento_screen.dart';
import 'package:caixa_hackaton_app/app/modules/contas_cartoes/contas_cartoes.dart';
import 'package:caixa_hackaton_app/app/modules/tesouros/sala_tesouro_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      bottomNavigationBar: Container(
        height: 130,
        padding: const EdgeInsets.only(bottom: 30, top: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: const BottomBar(useAnimation: true),
      ),
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: GestureDetector(
          onTap: () {
            Get.to(() => LancamentoScreen());
          },
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset('assets/drawer.png'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Olá, Xovem Novin",
                style: GoogleFonts.robotoCondensed(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const ResumoSaldoWidget(),
            const SizedBox(height: 15),
            const InvestimentoWidget(),
            const SizedBox(height: 15),
            const PassosWidget(),
            const SizedBox(height: 15),
            const ConsorcioWidget(),
            const SizedBox(height: 15),
            const AssuntosWidget(),
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
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 19 / 16,
                            color: const Color(0xffdedede),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "R\$ 1.776,12",
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 20,
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
                      "Meta do mês",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 19 / 16,
                        color: const Color(0xffdedede),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "R\$ 3.000,00",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 20,
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
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ContasCartoesScreen();
                }));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Minhas contas e cartões",
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 21 / 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    ">>",
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 21 / 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InvestimentoWidget extends StatelessWidget {
  const InvestimentoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Valor Investido",
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 19 / 16,
                            color: const Color(0xffdedede),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "R\$ 500,00",
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 20,
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Rendimentos do mês",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 19 / 16,
                        color: const Color(0xffdedede),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "+ R\$ 3,19",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 23 / 20,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ContasCartoesScreen();
                }));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Meus investimentos e poupanças",
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 21 / 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    ">>",
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 21 / 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
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
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
                      fontSize: 18,
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
                      fontSize: 16,
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
                fontSize: 18,
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
            width: 75,
            height: 75,
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
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Assuntos para aprender",
              style: GoogleFonts.robotoCondensed(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                height: 21 / 18,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 110,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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

class ConsorcioWidget extends StatelessWidget {
  const ConsorcioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Produtos que combinam com você",
              style: GoogleFonts.robotoCondensed(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                height: 21 / 18,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF505050),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .85,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Consórcio fácil da Caixa",
                                    style: GoogleFonts.robotoCondensed(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      height: 21 / 18,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Realize o sonho do carro novo pagando as menores parcelas",
                                    style: GoogleFonts.robotoCondensed(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      height: 19 / 16,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Image.asset(
                                "assets/x.png",
                                scale: 1.7,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Conhecer agora",
                              style: GoogleFonts.robotoCondensed(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                height: 21 / 18,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              ">>  ",
                              style: GoogleFonts.robotoCondensed(
                                fontSize: 18,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
