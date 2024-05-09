import 'package:flutter/material.dart';

void main() {
  runApp(Calcular());
}

class Calcular extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CALCULAR IMC',
      theme: ThemeData(
        primarySwatch: Colors.grey, 
      ),
      home: CalcularIMCPage(),
    );
  }
}

class CalculadoraIMC {
  double calculadoraIMC(double peso, double altura) {
    return peso / (altura * altura);
  }

  String classificarIMC(double imc) {
    if (imc < 16) {
      return 'Magreza grave';
    } else if (imc < 16.9) {
      return 'Magreza moderada';
    } else if (imc < 18.5) {
      return 'Magreza leve';
    } else if (imc < 24.9) {
      return 'Peso ideal';
    } else if (imc < 29.9) {
      return 'Sobrepeso';
    } else if (imc < 34.9) {
      return 'Obesidade grau I';
    } else if (imc < 39.9) {
      return 'Obesidade grau II (severa)';
    } else {
      return 'Obesidade grau III (mórbida)';
    }
  }
}

class CalcularIMCPage extends StatefulWidget {
  _CalculadoraIMCPageState createState() => _CalculadoraIMCPageState();
}

class _CalculadoraIMCPageState extends State<CalcularIMCPage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  double resultadoIMC = 0.0;
  String classificacaoIMC = '';

  void calcularIMC() {
    double peso = double.tryParse(pesoController.text) ?? 0.0;
    double altura = double.tryParse(alturaController.text) ?? 0.0;

    setState(() {
      resultadoIMC = CalculadoraIMC().calculadoraIMC(peso, altura);
      classificacaoIMC = CalculadoraIMC().classificarIMC(resultadoIMC);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: alturaController,
              decoration: InputDecoration(
                labelText: 'Altura(m)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10), 
            TextField(
              controller: pesoController,
              decoration: InputDecoration(
                labelText: 'Peso(kg)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularIMC,
              child: Text('Calcular IMC'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 54, 216, 244), // Altera a cor do botão para vermelho
                onPrimary: Colors.white, // Altera a cor do texto do botão para branco
              ),
            ),
            Text('Seu IMC é: ${resultadoIMC.toStringAsFixed(2)}'),
            Text('Classificação: $classificacaoIMC'),
          ],
        ),
      ),
    );
  }
}
