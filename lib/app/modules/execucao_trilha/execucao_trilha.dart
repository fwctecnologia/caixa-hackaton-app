import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExecucaoTrilhaScreen extends StatefulWidget {
  const ExecucaoTrilhaScreen({super.key});

  @override
  State<ExecucaoTrilhaScreen> createState() => _ExecucaoTrilhaScreenState();
}

class _ExecucaoTrilhaScreenState extends State<ExecucaoTrilhaScreen> {
  final pageController = PageController();

  void onNext() {
    FocusScope.of(context).unfocus();

    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = pageController.positions.isNotEmpty ? pageController.page?.toInt() : 0;

    Widget _buildStepIndicator(int index, int currentPage) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.14,
        height: 4.5,
        decoration: BoxDecoration(
          color: currentPage >= index ? const Color(0xFF55A0D6) : const Color(0xFFBEBEBE),
          borderRadius: BorderRadius.circular(12),
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
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: PageView(
                controller: pageController,
                children: const [
                  StepOne(),
                  StepOne(),
                  StepOne(),
                  StepOne(),
                ],
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/finance_panel.png"),
          Text(
            "O que é a Bolsa de Valores?",
            style: GoogleFonts.robotoCondensed(fontWeight: FontWeight.w700, fontSize: 24, letterSpacing: -1),
          ),
        ],
      ),
    );
  }
}
