import 'package:flutter/material.dart';

class ResultadoPage extends  StatelessWidget {
  final List<String> resposta;

  const ResultadoPage({super.key, required this.resposta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resposta do Quiz')),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
         child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Sua Resposta:', 
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          //Lista de Resposta do usuario
          ...resposta.map((resposta) => Text('. $resposta', style: const TextStyle(fontSize: 18))).toList(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),//volta para tela inicial
            child:const Text('Voltar'),
          ),
        ],
      ),
      ),
    );
  }
}
