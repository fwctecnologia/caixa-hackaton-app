import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    print("a");
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Stepper(
                type: StepperType.horizontal,
                elevation: 0,
                currentStep: _currentStep,
                controlsBuilder: (BuildContext context, cd) {
                  return Column(
                    children: <Widget>[
                      Container(height: 40),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            if(_currentStep == 2){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AuthScreen();
                                  },
                                ),
                              );
                              return;
                            }
                            _currentStep += 1;
                            setState(() {});
                          },
                          child: const Text('Continuar'),
                        ),
                      ),
                      Container(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Colors.white,
                            elevation: 0,
                            foregroundColor: Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {
                            if (_currentStep == 0) return;
                            _currentStep -= 1;
                            setState(() {});
                          },
                          child: const Text('Voltar'),
                        ),
                      ),
                    ],
                  );
                },
                steps: [
                  Step(
                    title: Text(
                      '',
                      style: GoogleFonts.montserrat(),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Cadastre-se no',
                          style: GoogleFonts.montserrat(
                            height: 0.8,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'LC Bank',
                          style: GoogleFonts.montserrat(
                            height: 1.2,
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Container(height: 40),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'E-mail',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                          ),
                        ),
                        Container(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Senha',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: Text(
                      '',
                      style: GoogleFonts.montserrat(),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Informacoes de contato',
                          style: GoogleFonts.montserrat(
                            height: 0.8,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Container(height: 40),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Nome',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                          ),
                        ),
                        Container(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Sobrenome',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                          ),
                        ),
                        Container(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Telefone',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 1,
                    state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: Text(
                      '',
                      style: GoogleFonts.montserrat(),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Falta pouco! Confirme os dados',
                          style: GoogleFonts.montserrat(
                            height: 0.8,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Container(height: 40),
                        TextField(
                          controller: TextEditingController(text: "fulano@gmail.com"),
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'E-mail',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                          ),
                        ),
                        Container(height: 10),
                        TextField(
                          controller: TextEditingController(text: "Fulano de tal"),
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Nome',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                          ),
                        ),
                        Container(height: 10),
                        TextField(
                          controller: TextEditingController(text: "da Silva"),
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Sobrenome',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                          ),
                        ),
                        Container(height: 10),
                        TextField(
                          controller: TextEditingController(text: "(71) 9 9999-9999"),
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Telefone',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 2,
                    state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
