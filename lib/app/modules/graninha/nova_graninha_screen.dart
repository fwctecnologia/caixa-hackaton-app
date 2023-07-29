import 'package:caixa_hackaton_app/app/modules/tesouros/sala_tesouro_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class NovaGraninhaScreen extends StatefulWidget {
  const NovaGraninhaScreen({super.key});

  @override
  State<NovaGraninhaScreen> createState() => _NovaGraninhaScreenState();
}

class _NovaGraninhaScreenState extends State<NovaGraninhaScreen> {
  bool isEditingName = false;

  @override
  void initState() {
    super.initState();
  }

  SMITrigger? _entrarTrigger;
  SMITrigger? _sairTrigger;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'Estado');
    artboard.addController(controller!);
    _entrarTrigger = controller.findInput<bool>('Entrar') as SMITrigger;
    _sairTrigger = controller.findInput<bool>('Sair') as SMITrigger;
  }

  void _entrar() => _entrarTrigger?.fire();
  void _sair() => _sairTrigger?.fire();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nova Graninha!!!',
          style: GoogleFonts.robotoCondensed(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Container(),
        forceMaterialTransparency: true,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _sair();
      //   },
      // ),
      body: false
          ? RiveAnimation.asset(
              'assets/new_file_1.riv',
              artboard: "Graninha",
              onInit: _onRiveInit,
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/graninha.png",
                        scale: 1.2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  isEditingName
                      ? TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nome da Graninha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFF505050),
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFF505050),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Nome",
                                      style: GoogleFonts.robotoCondensed(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xffbebebe),
                                      ),
                                    ),
                                    Text(
                                      "Teodoro",
                                      style: GoogleFonts.robotoCondensed(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  "assets/edit.png",
                                  width: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                  const SizedBox(height: 20),
                  Text(
                    "Raridade: Baixa",
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Tipo: Moeda",
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Características: \n  -  Bochechas rosadas\n  -  Faminto",
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(330, 50),
                          backgroundColor: const Color(0xff55A0D6),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Ok",
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const SalaTesouroScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Ir para Sala do Tesouro",
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
    );
  }
}
