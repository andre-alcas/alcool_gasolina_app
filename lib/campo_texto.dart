import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  final campoEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrada de dados'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: TextField(
              controller: campoEC,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Digite um valor"),
              maxLength: 6,
              style: const TextStyle(fontSize: 50, color: Colors.green),
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }
}
