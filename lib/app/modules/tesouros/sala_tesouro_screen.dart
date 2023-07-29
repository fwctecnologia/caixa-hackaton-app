import 'package:caixa_hackaton_app/app/modules/home/home_screen.dart';
import 'package:caixa_hackaton_app/app/modules/lancamento/lancamento_screen.dart';
import 'package:caixa_hackaton_app/app/modules/tesouros/tesouro_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

class SalaTesouroScreen extends StatefulWidget {
  const SalaTesouroScreen({super.key});

  @override
  State<SalaTesouroScreen> createState() => _SalaTesouroScreenState();
}

class _SalaTesouroScreenState extends State<SalaTesouroScreen> {
  void showInfoDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return const TesouroDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Sala do Tesouro",
            style: GoogleFonts.robotoCondensed(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(
              "assets/drawer-preto.png",
              scale: 1.8,
            ),
          ),
          foregroundColor: Colors.black,
          forceMaterialTransparency: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showInfoDialog();
              },
              child: SizedBox(
                // color: Colors.red,
                height: 650,
                child: Stack(children: [
                  const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    left: 20,
                    child: Image.asset(
                      "assets/nuvem_1.png",
                      scale: 1,
                    ),
                  ),
                  Positioned(
                    left: 12,
                    top: 40,
                    child: Image.asset(
                      "assets/nuvem_1.png",
                      scale: 1.6,
                    ),
                  ),
                  Positioned(
                    left: 130,
                    child: Image.asset(
                      "assets/nuvem_1.png",
                    ),
                  ),
                  Positioned(
                    left: 240,
                    top: 30,
                    child: Image.asset(
                      "assets/nuvem_1.png",
                      scale: .9,
                    ),
                  ),
                  Positioned(
                    left: 340,
                    top: 0,
                    child: Image.asset(
                      "assets/nuvem_1.png",
                      scale: 1.2,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 10,
                    child: Image.asset(
                      "assets/cartilho.png",
                      scale: 1.4,
                    ),
                  ),
                  Positioned(
                    top: 180,
                    right: 30,
                    child: Image.asset(
                      "assets/graninha1.png",
                      scale: 1.6,
                    ),
                  ),
                  Positioned(
                    top: 300,
                    right: 140,
                    child: Image.asset(
                      "assets/graninha2.png",
                      scale: 0.8,
                    ),
                  ),
                  Positioned(
                    top: 320,
                    right: 10,
                    child: Image.asset(
                      "assets/graninha3.png",
                      scale: 1.7,
                    ),
                  ),
                  Positioned(
                    bottom: 95,
                    left: 15,
                    child: Image.asset(
                      "assets/cacto.png",
                      scale: 1.7,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Image.asset(
                      "assets/cadeira.png",
                      scale: 1.7,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 100,
                    child: Image.asset(
                      "assets/grana.png",
                      scale: 1.7,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Image.asset(
                      "assets/ourograninha.png",
                      scale: 1.7,
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, bottom: 20, top: 5),
              child: Text(
                "Minhas Graninhas: 6",
                style: GoogleFonts.robotoCondensed(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const BottomBar()
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatefulWidget {
  final bool useAnimation;
  const BottomBar({
    super.key,
    this.useAnimation = false,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
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
  void initState() {
    if (mounted && widget.useAnimation) {
      Future.delayed(const Duration(seconds: 1), () {
        _entrar();
      });
      // Future.delayed(const Duration(seconds: 5), () {
      //   _sair();
      // });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          child: CircleAvatar(
            backgroundColor: const Color(0xFF55A0D6),
            radius: 40,
            child: Image.asset(
              "assets/home.png",
              scale: 1.5,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // TODO: nova despesa
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LancamentoScreen(),
              ),
            );
          },
          child: CircleAvatar(
            backgroundColor: const Color(0xFF55A0D6),
            radius: 40,
            child: Image.asset(
              "assets/add.png",
              scale: 1.5,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // TODO: despesas
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          child: widget.useAnimation
              ? GestureDetector(
                  onTap: () async {
                    _sair();
                    await Future.delayed(const Duration(milliseconds: 1300));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SalaTesouroScreen(),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 110,
                    child: RiveAnimation.asset(
                      'assets/new_file_1.riv',
                      artboard: "Graninha",
                      onInit: _onRiveInit,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () async {
                    final Uri _url = Uri.parse(
                        'https://vaidevisa.visa.com.br/vdv/beneficios/busca');
                    await launchUrl(_url);
                  },
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFF55A0D6),
                    radius: 40,
                    child: Image.asset(
                      "assets/cart.png",
                      scale: 1.5,
                    ),
                  ),
                ),
        )
      ],
    );
  }
}
