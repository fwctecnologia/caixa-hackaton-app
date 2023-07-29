import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletarCadastroScreen extends StatefulWidget {
  const CompletarCadastroScreen({super.key});

  @override
  State<CompletarCadastroScreen> createState() =>
      _CompletarCadastroScreenState();
}

class _CompletarCadastroScreenState extends State<CompletarCadastroScreen> {
  final pageController = PageController();
  int totalAcertos = 0;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {});
    });
  }

  void onSkip() {
    Navigator.of(context).pop();
  }

  void onNext() {
    FocusScope.of(context).unfocus();

    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentPage =
        pageController.positions.isNotEmpty ? pageController.page?.toInt() : 0;

    Widget _buildStepIndicator(int index, int currentPage) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.14,
        height: 4.5,
        decoration: BoxDecoration(
          color: currentPage >= index
              ? const Color(0xFF55A0D6)
              : const Color(0xFFBEBEBE),
          borderRadius: BorderRadius.circular(12),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStepIndicator(0, currentPage ?? 0),
                _buildStepIndicator(1, currentPage ?? 0),
                _buildStepIndicator(2, currentPage ?? 0),
                _buildStepIndicator(3, currentPage ?? 0),
                _buildStepIndicator(4, currentPage ?? 0),
                _buildStepIndicator(5, currentPage ?? 0),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: PageView(
                controller: pageController,
                children: const [
                  StepOne(),
                  StepTwo(),
                  StepThree(),
                  StepFour(),
                  StepFive(),
                  StepSix(),
                ],
              ),
            ),
            if (currentPage != 5) ...[
              InkWell(
                onTap: onNext,
                child: Container(
                    height: 65,
                    decoration: const BoxDecoration(
                      color: Color(0xFF55A0D6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Continuar",
                            style: GoogleFonts.robotoCondensed(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              height: 28 / 24,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Icon(Icons.arrow_forward)
                        ],
                      ),
                    )),
              )
              // CustomElevatedButton(
              //   text: currentPage == 0 ? "INICIAR" : "PRÓXIMO",
              //   onPressed: onNext,
              // ),
              // TextButton(
              //   onPressed: onSkip,
              //   child: const Text(
              //     "Pular",
              //     // fontWeight: FontWeight.w300,
              //     // decoration: TextDecoration.underline,
              //   ),
              // ),
            ],
            if (currentPage == 5) ...[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    height: 65,
                    decoration: const BoxDecoration(
                      color: Color(0xFF55A0D6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Receber Prêmio",
                            style: GoogleFonts.robotoCondensed(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              height: 28 / 24,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Icon(Icons.arrow_forward)
                        ],
                      ),
                    )),
              )
            ],
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Como podemos te chamar?",
            style: GoogleFonts.robotoCondensed(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          TextFormField(
            autofocus: true,
            style: GoogleFonts.robotoCondensed(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              color: const Color(0xffbebebe),
              height: 28 / 24,
            ),
            decoration: InputDecoration(
                hintText: "Digite seu nome ou apelido",
                border: InputBorder.none,
                hintStyle: GoogleFonts.robotoCondensed(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffbebebe),
                  height: 28 / 24,
                )),
          ),
        ],
      ),
    );
  }
}

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Qual sua data de nascimento?",
            style: GoogleFonts.robotoCondensed(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              height: 28 / 24,
            ),
            textAlign: TextAlign.center,
          ),
          TextFormField(
            autofocus: true,
            style: GoogleFonts.robotoCondensed(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: const Color(0xffbebebe),
              height: 28 / 24,
            ),
            decoration: InputDecoration(
                hintText: "Digite sua data de nascimento",
                border: InputBorder.none,
                hintStyle: GoogleFonts.robotoCondensed(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xffbebebe),
                  height: 28 / 24,
                )),
          ),
        ],
      ),
    );
  }
}

class StepThree extends StatelessWidget {
  const StepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "O que te traz aqui?",
              style: GoogleFonts.robotoCondensed(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Selecione pelo menos uma das opções",
              style: GoogleFonts.robotoCondensed(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 23 / 20,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            const CheckBoxOption(
              title:
                  "Quero aprender a organizar minhas finanças para ficar mais tranquilo com o dinheiro",
            ),
            const CheckBoxOption(
              title: "Tenho um objetivo financeiro. (Comprar um carro por ex.)",
            ),
            const CheckBoxOption(
              title: "Quero aprender a investir e construir riqueza",
            ),
            const CheckBoxOption(
              title: "Quero me livrar de uma dívida ou evitar o endividamento",
            ),
          ],
        ),
      ),
    );
  }
}

class StepFour extends StatelessWidget {
  const StepFour({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quais desses você já usa?",
              style: GoogleFonts.robotoCondensed(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Se ainda não usa nenhum, pode passar",
              style: GoogleFonts.robotoCondensed(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 23 / 20,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            const CheckBoxOption(title: "Cartão de crédito"),
            const CheckBoxOption(title: "Conta corrente"),
            const CheckBoxOption(title: "Pix"),
            const CheckBoxOption(title: "Pagamento por aproximação"),
            const CheckBoxOption(title: "Google Wallet ou Apple Pay"),
            const CheckBoxOption(title: "Linhas de crédito"),
          ],
        ),
      ),
    );
  }
}

class StepFive extends StatelessWidget {
  const StepFive({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quais desses você quer usar?",
              style: GoogleFonts.robotoCondensed(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Selecione todos os que você se interessa",
              style: GoogleFonts.robotoCondensed(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 23 / 20,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            const CheckBoxOption(title: "Cartão de crédito"),
            const CheckBoxOption(title: "Conta corrente"),
            const CheckBoxOption(title: "Pix"),
            const CheckBoxOption(title: "Pagamento por aproximação"),
            const CheckBoxOption(title: "Google Wallet ou Apple Pay"),
            const CheckBoxOption(title: "Linhas de crédito"),
          ],
        ),
      ),
    );
  }
}

class StepSix extends StatelessWidget {
  const StepSix({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Você ganhou uma Graninha!!!  🤑",
            style: GoogleFonts.robotoCondensed(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 28 / 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Image.asset(
            "assets/motivacional.png",
            scale: 0.8,
          ),
          const SizedBox(height: 40),
          Text(
            "\"Graninhas” são nossos personagens colecionáveis.",
            style: GoogleFonts.robotoCondensed(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            "Ganhe Graninhas ao completar desafios e desbloquear conquistas no App",
            style: GoogleFonts.robotoCondensed(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class CheckBoxOption extends StatefulWidget {
  final String title;
  const CheckBoxOption({
    super.key,
    required this.title,
  });

  @override
  State<CheckBoxOption> createState() => _CheckBoxOptionState();
}

class _CheckBoxOptionState extends State<CheckBoxOption> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _checked = !_checked;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _checked ? Colors.white : const Color(0xffbebebe),
          ),
          color: _checked ? Colors.white12 : Colors.transparent,
        ),
        child: Row(
          children: [
            Checkbox(
              value: _checked,
              onChanged: (v) {
                setState(() {
                  _checked = v!;
                });
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: _checked ? Colors.white : const Color(0xffbebebe),
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

