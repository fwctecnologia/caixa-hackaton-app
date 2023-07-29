import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorizacaoScreen extends StatefulWidget {
  const CategorizacaoScreen({super.key});

  @override
  State<CategorizacaoScreen> createState() => _CategorizacaoScreenState();
}

class _CategorizacaoScreenState extends State<CategorizacaoScreen> {
  List<dynamic> categorias = [
    {
      "nome": "Jogos",
      "icone": "assets/controle.png",
      "cor": Color(0xFF55A0D6),
      "valor":1,
      "total": "R\$ 859,30"
    },
    {
      "nome": "Comida",
      "icone": "assets/burguer.png",
      "cor": Color(0xFFD41E24),
      "valor":2,
      "total": "R\$ 859,30"
    },
    {
      "nome": "Pet",
      "icone": "assets/1.png",
      "cor": Color(0xFF55A0D6),
      "valor":3,
      "total": "R\$ 859,30"
    },
    {
      "nome": "Lazer",
      "icone": "assets/2.png",
      "cor": Color(0xFF55A0D6),
      "valor":4,
      "total": "R\$ 859,30"
    },
    {
      "nome": "Moradia",
      "icone": "assets/3.png",
      "cor": Color(0xFFDAA83C),
      "valor":5,
      "total": "R\$ 859,30"
    },
    {
      "nome": "Roupas",
      "icone": "assets/4.png",
      "cor": Color(0xFF55A0D6),
      "valor":6,
      "total": "R\$ 859,30"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/caixa_2.png',
                ),
                Container(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Conta Caixa Xovem',
                      style: GoogleFonts.robotoCondensed(
                        height: 0.8,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'R\$ 728,34',
                      style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.w500,
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Movimentacoes',
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Ver tudo',
                      style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      size: 20,
                    )
                  ],
                )
              ],
            ),
            Container(height: 10),
            cardMovimentacoes(
              'assets/controle.png',
              'Compra de cartuchos de SNES',
              'Compra Caixa Xovem',
              '29/07/2023',
              '- R\$ 253,50',

            ),
            Container(height: 10),
            cardMovimentacoes(
              'assets/burguer.png',
              'Lanche da tarde',
              'Cartão Caixa Xovem',
              '29/07/2023',
              '- R\$ 12,80',

            ),
            Container(height: 20),
            Text(
              'Gastos por categoria',
              style: GoogleFonts.robotoCondensed(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            Container(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (2.2/ 1),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(
                  categorias.length,
                  (index) {
                    return cardCategoria(
                      categorias[index]['icone'],
                      categorias[index]['nome'],
                      categorias[index]['cor'],
                      categorias[index]['total'],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget cardMovimentacoes(
  String assetUrl,
  String titulo,
  String subtitulo,
  String saldo,
  String novoSaldo,
) {
  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Color(0XFF505050),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                assetUrl,
              ),
              SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.robotoCondensed(
                          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white, letterSpacing: -1),
                    ),
                    Text(
                      subtitulo,
                      style: GoogleFonts.robotoCondensed(
                          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white, letterSpacing: -1),
                    ),
                    Text(
                      'R\$ ${saldo}',
                      style: GoogleFonts.robotoCondensed(
                          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white, letterSpacing: -1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(
          '${novoSaldo}',
          style: GoogleFonts.robotoCondensed(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.white,
            letterSpacing: -1,
          ),
        ),
      ],
    ),
  );
}

Widget cardCategoria(
  String assetUrl,
  String titulo,
  Color cor,
  String total,
) {
  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Color(0XFF505050),
    ),
    alignment: Alignment.center,
    child:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetUrl,
              height: 40,
            ),
            Text(
              titulo,
              style: GoogleFonts.robotoCondensed(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.white,
              ),
            ),

          ],
        ),
       SizedBox(width: 10),
       Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             total,
             style: GoogleFonts.robotoCondensed(
               fontWeight: FontWeight.w500,
               fontSize: 20,
               color: Colors.white,
             ),
           ),
           SizedBox(height:5),
           ClipRRect(
             borderRadius: BorderRadius.circular(8),
             child: Container(
               width: 70,
               child:  LinearProgressIndicator(
                 minHeight: 8,
                 backgroundColor: Colors.white,
                 valueColor: AlwaysStoppedAnimation<Color>(
                   cor,
                 ),
                 value: 0.5,
               ),
             ),
           ),
         ],
       )

      ],
    ),
  );
}