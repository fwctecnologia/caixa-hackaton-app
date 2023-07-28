import 'package:flutter/material.dart';

class CompletarCadastroScreen extends StatefulWidget {
  const CompletarCadastroScreen({super.key});

  @override
  State<CompletarCadastroScreen> createState() =>
      _CompletarCadastroScreenState();
}

class _CompletarCadastroScreenState extends State<CompletarCadastroScreen> {
  final pageController = PageController();

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
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Continuar",
                            style: TextStyle(
                              fontFamily: "Roboto Condensed",
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
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Receber Prêmio",
                            style: TextStyle(
                              fontFamily: "Roboto Condensed",
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
          const Text(
            "Como podemos te chamar?",
            style: TextStyle(
              fontFamily: "Roboto Condensed",
              fontSize: 24,
              fontWeight: FontWeight.w500,
              height: 28 / 24,
            ),
            textAlign: TextAlign.center,
          ),
          TextFormField(
            autofocus: true,
            style: const TextStyle(
              fontFamily: "Roboto Condensed",
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Color(0xffbebebe),
              height: 28 / 24,
            ),
            decoration: const InputDecoration(
                hintText: "Digite seu nome ou apelido",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontFamily: "Roboto Condensed",
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Color(0xffbebebe),
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
          const Text(
            "Qual sua data de nascimento?",
            style: TextStyle(
              fontFamily: "Roboto Condensed",
              fontSize: 24,
              fontWeight: FontWeight.w500,
              height: 28 / 24,
            ),
            textAlign: TextAlign.center,
          ),
          TextFormField(
            autofocus: true,
            style: const TextStyle(
              fontFamily: "Roboto Condensed",
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Color(0xffbebebe),
              height: 28 / 24,
            ),
            decoration: const InputDecoration(
                hintText: "Digite sua data de nascimento",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontFamily: "Roboto Condensed",
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Color(0xffbebebe),
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
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "O que te traz aqui?",
              style: TextStyle(
                fontFamily: "Roboto Condensed",
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "Selecione pelo menos uma das opções",
              style: TextStyle(
                fontFamily: "Roboto Condensed",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 23 / 20,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            CheckBoxOption(
              title:
                  "Quero aprender a organizar minhas finanças para ficar mais tranquilo com o dinheiro",
            ),
            CheckBoxOption(
              title: "Tenho um objetivo financeiro. (Comprar um carro por ex.)",
            ),
            CheckBoxOption(
              title: "Quero aprender a investir e construir riqueza",
            ),
            CheckBoxOption(
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
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quais desses você já usa?",
              style: TextStyle(
                fontFamily: "Roboto Condensed",
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "Se ainda não usa nenhum, pode passar",
              style: TextStyle(
                fontFamily: "Roboto Condensed",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 23 / 20,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            CheckBoxOption(title: "Cartão de crédito"),
            CheckBoxOption(title: "Conta corrente"),
            CheckBoxOption(title: "Pix"),
            CheckBoxOption(title: "Pagamento por aproximação"),
            CheckBoxOption(title: "Google Wallet ou Apple Pay"),
            CheckBoxOption(title: "Linhas de crédito"),
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
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quais desses você quer usar?",
              style: TextStyle(
                fontFamily: "Roboto Condensed",
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 28 / 24,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "Selecione todos os que você se interessa",
              style: TextStyle(
                fontFamily: "Roboto Condensed",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 23 / 20,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            CheckBoxOption(title: "Cartão de crédito"),
            CheckBoxOption(title: "Conta corrente"),
            CheckBoxOption(title: "Pix"),
            CheckBoxOption(title: "Pagamento por aproximação"),
            CheckBoxOption(title: "Google Wallet ou Apple Pay"),
            CheckBoxOption(title: "Linhas de crédito"),
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
          const Text(
            "Você ganhou uma Graninha!!!  🤑",
            style: TextStyle(
              fontFamily: "Roboto Condensed",
              fontSize: 24,
              fontWeight: FontWeight.w500,
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
          const Text(
            "\"Graninhas” são nossos personagens colecionáveis.",
            style: TextStyle(
              fontFamily: "Roboto Condensed",
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          const Text(
            "Ganhe Graninhas ao completar desafios e desbloquear conquistas no App",
            style: TextStyle(
              fontFamily: "Roboto Condensed",
              fontWeight: FontWeight.w500,
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
                  style: TextStyle(
                    fontFamily: "Roboto Condensed",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
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
