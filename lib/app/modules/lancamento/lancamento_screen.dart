import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/home_screen.dart';

class LancamentoScreen extends StatefulWidget {
  const LancamentoScreen({super.key});

  @override
  State<LancamentoScreen> createState() => _LancamentoScreenState();
}

class _LancamentoScreenState extends State<LancamentoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          'Novo Lancamento',
          style: GoogleFonts.robotoCondensed(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: -1,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset('assets/chevron_right.png'),
        ),
        actions: [
          Image.asset('assets/medal.png'),
          Container(width: 20),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16).copyWith(left: 40, right: 40),
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF55A0D6),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () async {
            Get.showSnackbar(
              const GetSnackBar(
                message: 'Lançamento cadastrado com sucesso!',
                duration: Duration(seconds: 2),
                backgroundColor: Colors.green,
              ),
            );
            Get.to(() => const HomeScreen());
          },
          child: Text(
            'Confirmar',
            style: GoogleFonts.robotoCondensed(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textFieldComponent('Descrição'),
            _textFieldComponent('Valor'),
            _dropdownComponent('Tipo', ['Entrada', 'Saida']),
            _dropdownComponent('Categoria', ['Games', 'Lazer', 'Comida', 'Transporte', 'Outros']),
            _dropdownComponent('Pago com', ['Conta caixa xovem', 'Conta poupanca']),
            _textFieldComponent('Data', suffixIconUrl: 'assets/calendar.png', isDate: true),
          ],
        ),
      ),
    );
  }
}

Widget _textFieldComponent(String label, {String? suffixIconUrl, bool isDate = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      color: const Color(0xFF505050),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: TextFormField(
      style: GoogleFonts.robotoCondensed(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      inputFormatters: [
        if (isDate) FilteringTextInputFormatter.digitsOnly,
        if (isDate) DataInputFormatter(),
      ],
      decoration: InputDecoration(
        labelText: label,
        border: InputBorder.none,
        filled: true,
        fillColor: const Color(0xFF505050),
        labelStyle: GoogleFonts.robotoCondensed(
          color: const Color(0XFFBEBEBE),
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        suffixIcon: suffixIconUrl != null
            ? Image.asset(
                suffixIconUrl,
                width: 20,
                height: 20,
              )
            : null,
      ),
    ),
  );
}

Widget _dropdownComponent(String label, List<String> opcoes) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      color: const Color(0xFF505050),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        border: InputBorder.none,
        filled: true,
        fillColor: const Color(0xFF505050),
        labelStyle: GoogleFonts.robotoCondensed(
          color: const Color(0XFFBEBEBE),
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      items: [
        ...opcoes.map((e) => DropdownMenuItem(
              child: Text(e),
              value: e,
            )),
      ],
      onChanged: (value) {},
    ),
  );
}
