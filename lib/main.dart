
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ConversieMoneda(),
    debugShowCheckedModeBanner: false,
  ));
}

class ConversieMoneda extends StatefulWidget {
  @override
  State<ConversieMoneda> createState() => _ConversieMonedaState();
}

class _ConversieMonedaState extends State<ConversieMoneda> {
  final sumaController = TextEditingController();

  String sursa = 'MDL';
  String destinatie = 'EUR';
  String rezultat = '';

  final Map<String, double> curs = {
    'MDL': 19.5,
    'EUR': 1.0,
    'USD': 1.08,
    'RON': 4.97,
  };

  void converteste() {
    double? suma = double.tryParse(
      sumaController.text.replaceAll(',', '.'),
    );

    if (suma == null) {
      setState(() {
        rezultat = 'Introdu o suma valida!';
      });
      return;
    }

    double sumaEUR = suma / curs[sursa]!;
    double sumaFinala = sumaEUR * curs[destinatie]!;

    setState(() {
      rezultat = sumaFinala.toStringAsFixed(2) + ' ' + destinatie;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversie moneda')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: sumaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Introdu suma',
              ),
            ),

            DropdownButton<String>(
              value: sursa,
              items: curs.keys.map((moneda) {
                return DropdownMenuItem(
                  value: moneda,
                  child: Text(moneda),
                );
              }).toList(),
              onChanged: (valoare) {
                setState(() {
                  sursa = valoare!;
                });
              },
            ),

            DropdownButton<String>(
              value: destinatie,
              items: curs.keys.map((moneda) {
                return DropdownMenuItem(
                  value: moneda,
                  child: Text(moneda),
                );
              }).toList(),
              onChanged: (valoare) {
                setState(() {
                  destinatie = valoare!;
                });
              },
            ),

            ElevatedButton(
              onPressed: converteste,
              child: Text('Converteste'),
            ),

            Text('Rezultat: $rezultat'),
          ],
        ),
      ),
    );
  }
}
