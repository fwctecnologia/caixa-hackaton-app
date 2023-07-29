import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/auth_screen.dart';

class ExecucaoTrilhaScreen extends StatefulWidget {
  const ExecucaoTrilhaScreen({super.key});

  @override
  State<ExecucaoTrilhaScreen> createState() => _ExecucaoTrilhaScreenState();
}

class _ExecucaoTrilhaScreenState extends State<ExecucaoTrilhaScreen> {
  final pageController = PageController();
  int totalAcertos = 0;
  int? nineChecked;
  int? tenChecked;
  int? elevenChecked;

  void onNext() {
    setState(() {});
    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = pageController.positions.isNotEmpty ? pageController.page?.toInt() : 0;
    Widget _buildStepIndicator(int index, int currentPage) {
      return Expanded(
        child: Container(
          height: 4.5,
          decoration: BoxDecoration(
            color: currentPage >= index ? const Color(0xFF55A0D6) : const Color(0xFFBEBEBE),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          'Aprendizado Financeiro',
          style: GoogleFonts.robotoCondensed(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: -1
          ),
        ),
        leading: Image.asset('assets/chevron_right.png'),
        actions: [
          Image.asset('assets/medal.png'),
          Container(width: 20),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStepIndicator(0, currentPage ?? 0),
                _buildStepIndicator(1, currentPage ?? 0),
                _buildStepIndicator(2, currentPage ?? 0),
                _buildStepIndicator(3, currentPage ?? 0),
                _buildStepIndicator(4, currentPage ?? 0),
                _buildStepIndicator(5, currentPage ?? 0),
                _buildStepIndicator(6, currentPage ?? 0),
                _buildStepIndicator(7, currentPage ?? 0),
                _buildStepIndicator(8, currentPage ?? 0),
                _buildStepIndicator(9, currentPage ?? 0),
                _buildStepIndicator(10, currentPage ?? 0),
                _buildStepIndicator(11, currentPage ?? 0),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  StepOne(),
                  StepTwo(),
                  StepThree(),
                  StepFour(),
                  StepFive(),
                  StepSix(),
                  StepSeven(),
                  StepEight(),
                  StepNine(
                    onTap: (int n) {
                      nineChecked = n;
                      setState(() {});
                    },
                    checkedNumber: nineChecked,
                  ),
                  StepTen(
                    onTap: (int n) {
                      tenChecked = n;
                      setState(() {});
                    },
                    checkedNumber: tenChecked,
                  ),
                  StepEleven(
                    onTap: (int n) {
                      elevenChecked = n;
                      setState(() {});
                    },
                    checkedNumber: elevenChecked,
                  ),
                  FinishStep(
                    onTap: (int a){},
                    qtdAcertos: totalAcertos,
                  )
                ],
              ),
            ),
            Visibility(
              visible: (currentPage??0)<11,
              child: InkWell(
                onTap: () {
                  if (currentPage == 8 && nineChecked == null ||
                      currentPage == 9 && tenChecked == null ||
                      currentPage == 10 && elevenChecked == null) {
                    return;
                  }

                  int nine = nineChecked == 2 ? 1 : 0;
                  int ten = tenChecked == 1 ? 1 : 0;
                  int eleven = elevenChecked == 3 ? 1 : 0;
                  totalAcertos = nine + ten + eleven;
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                  );
                },
                child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                      color: currentPage == 8 && nineChecked == null ||
                              currentPage == 9 && tenChecked == null ||
                              currentPage == 10 && elevenChecked == null
                          ? Color(0xFF55A0D6).withOpacity(0.1)
                          : Color(0xFF55A0D6),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Continuar",
                            style: GoogleFonts.robotoCondensed(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              height: 28 / 24,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepOne extends StatelessWidget {
  const StepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset("assets/finance_panel.png"),
              Container(height: 20),
              Text(
                "O que é a Bolsa de Valores?",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.white,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'A bolsa de valores e um lugar onde as pessoas compram e vendem ',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: '"pedacinhos", de empresas,',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                          text: ' chamados de ',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          )),
                      TextSpan(
                        text: 'acoes.',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset("assets/acoes.png"),
              Container(height: 20),
              Text(
                "Ações - Se Tornando Sócio de Empresas",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.white,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Ao compra acoes, voce se torna',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: ' socio de uma empresa, ',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                          text: 'mesmo que em uma escala pequena, e pode beneficiar do',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          )),
                      TextSpan(
                        text: ' desempenho ',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: 'dessa empresa',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepThree extends StatelessWidget {
  const StepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset("assets/investing.png"),
              Container(height: 20),
              Text(
                "Oportunidades e Riscos",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.white,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Comprar acoes pode fazer seu dinheiro',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: ' crescer muito, ',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                          text: 'mas, tambem pode diminuir. Tem que ficar de olho.',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepFour extends StatelessWidget {
  const StepFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset("assets/bolsa.png"),
              Container(height: 20),
              Text(
                "Como Investir na Bolsa?",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.white,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Para investir voce precisa de uma, ',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: 'corretora. ',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                          text: 'Alguma das mais utilizadas estao no link no final do modulo.',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepFive extends StatelessWidget {
  const StepFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset("assets/acompanhando.png"),
              Container(height: 20),
              Text(
                "Acompanhando seus Investimentos",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.white,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'E importante',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: ' checar constantemente ',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                          text: 'como suas acoes estao indo e estudar estrategias, para aumentar suas chances de ter '
                              'lucro e ',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          )),
                      TextSpan(
                        text: 'diminuir riscos.',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepSix extends StatelessWidget {
  const StepSix({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset("assets/receita.png"),
              Container(height: 20),
              Text(
                "Dividendos",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.white,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Algumas empresas pagam uma parte do seu lucro aos acionistas, isso se chama ',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: '“Pagamento de Dividendos” ',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                          text: ' e te permite ganhar dinheiro ',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          )),
                      TextSpan(
                        text: 'sem vender suas ações. .',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepSeven extends StatelessWidget {
  const StepSeven({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset(
                "assets/moon.png",
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              Container(height: 20),
              Text(
                "O que Influencia o Mercado de Ações?",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  letterSpacing: -1,
                  color: Colors.white,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Muitas coisas podem fazer as ações ',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: 'subirem ou cairem, ',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: 'como notícias sobre política ou o que acontece no mundo.\n',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                          text: ' se mantenha atualizado!',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepEight extends StatelessWidget {
  const StepEight({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset("assets/indice.png"),
              Container(height: 20),
              Text(
                "Índices do Mercado de Ações",
                style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  letterSpacing: -1,
                  color: Colors.white,
                ),
              ),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Os índices ajudam a entender se as ações  estão indo bem ou mal. Eles são como um',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: ' resumo ',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                          text: 'do que está acontecendo! \n\nVeja os links no final para mais informações',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StepNine extends StatelessWidget {
  final Function(int n) onTap;
  final int? checkedNumber;

  const StepNine({
    super.key,
    required this.onTap,
    required this.checkedNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "O que é a Bolsa de Valores?",
              style: GoogleFonts.robotoCondensed(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CheckBoxOption(
              title: "Um lugar para comprar e vender imóveis",
              onTap: onTap,
              number: 0,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "Um banco que empresa dinheiro para estudantes e jovens",
              onTap: onTap,
              number: 1,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "Um mercado onde se negociam partes de empresas (ações)",
              onTap: onTap,
              number: 2,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "Um tipo de bolsa para colocar dinheiro",
              onTap: onTap,
              number: 3,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "Nenhuma das alternativas",
              onTap: onTap,
              number: 4,
              checkedNumber: checkedNumber,
            ),
          ],
        ),
      ),
    );
  }
}

class StepTen extends StatelessWidget {
  final Function(int n) onTap;
  final int? checkedNumber;

  const StepTen({
    super.key,
    required this.onTap,
    required this.checkedNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "O que são “Dividendos” ?",
              style: GoogleFonts.robotoCondensed(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CheckBoxOption(
              title: "É o valor que os investidores pagam para comprar ações na bolsa",
              onTap: onTap,
              number: 0,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "É uma parte do lucro de uma empresa que ela divide com seus investidores",
              onTap: onTap,
              number: 1,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "É o valor que os investidores recebem ao vender uma ação",
              onTap: onTap,
              number: 2,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "É o valor que se paga para a corretora por intermediar a venda das ações",
              onTap: onTap,
              number: 3,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "É o valor que o investidor fica devendo ao perder dinheiro na bolsa",
              onTap: onTap,
              number: 4,
              checkedNumber: checkedNumber,
            ),
          ],
        ),
      ),
    );
  }
}

class StepEleven extends StatelessWidget {
  final Function(int n) onTap;
  final int? checkedNumber;

  const StepEleven({
    super.key,
    required this.onTap,
    required this.checkedNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Complete a frase: Investir na bolsa....",
              style: GoogleFonts.robotoCondensed(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CheckBoxOption(
              title: "...sempre dá lucros",
              onTap: onTap,
              number: 0,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "...é apenas para corretores de ações",
              onTap: onTap,
              number: 1,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "...não é lucrativo",
              onTap: onTap,
              number: 2,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "...pode trazer lucros ou prejuízo",
              onTap: onTap,
              number: 3,
              checkedNumber: checkedNumber,
            ),
            CheckBoxOption(
              title: "Nenhuma das alternativas se encaixa",
              onTap: onTap,
              number: 4,
              checkedNumber: checkedNumber,
            ),
          ],
        ),
      ),
    );
  }
}

class FinishStep extends StatelessWidget {
  final Function(int n) onTap;
  final int qtdAcertos;

  const FinishStep({
    super.key,
    required this.onTap,
    required this.qtdAcertos,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "APROVADO",
              style: GoogleFonts.robotoCondensed(fontSize: 32, fontWeight: FontWeight.w700,color: Colors.blue),
            ),
            Image.asset("assets/result.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  qtdAcertos.toString(),
                  style: GoogleFonts.robotoCondensed(fontSize: 64, fontWeight: FontWeight.w700,color: Colors.blue),
                ),
                Text(
                  " / 3",
                  style: GoogleFonts.robotoCondensed(fontSize: 64, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Text(
              "Respostas corretas",
              style: GoogleFonts.robotoCondensed(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            Container(height: 60),
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
                  'Resgatar Premio',
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBoxOption extends StatefulWidget {
  final String title;
  final Function(int n) onTap;
  final int number;
  final int? checkedNumber;

  const CheckBoxOption({
    super.key,
    required this.title,
    required this.onTap,
    required this.number,
    required this.checkedNumber,
  });

  @override
  State<CheckBoxOption> createState() => _CheckBoxOptionState();
}

class _CheckBoxOptionState extends State<CheckBoxOption> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.number);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: widget.checkedNumber == widget.number ? Colors.white : const Color(0xffbebebe),
          ),
          color: widget.checkedNumber == widget.number ? Colors.white12 : Colors.transparent,
        ),
        child: Row(
          children: [
            Checkbox(
              value: widget.checkedNumber == widget.number,
              onChanged: (v) {
                widget.onTap(widget.number);
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.title,
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: widget.checkedNumber == widget.number ? Colors.white : const Color(0xffbebebe),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
