import 'package:flutter/material.dart';
import 'package:flutter_atividade_form/componentes/resposta.dart';
import 'botao.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _formKey = GlobalKey<FormState>();
  final _perguntaController = TextEditingController();
  int _perguntaAtual = 0;

  final List<String> _perguntas = [
    "Qual é a capital do Brasil?",
    "Qual é a capital da Paraíba?",
    "Qual é a capital de São Paulo?",
    "Qual é a capital do Rio Grande do Norte?",
    "Qual a capital do Rio de Janeiro",
  ];

  final List<String> _respostas = [];

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _respostas.add(_perguntaController.text);
        _perguntaController.clear();

        if (_perguntaAtual < _perguntas.length - 1) {
          _perguntaAtual++;
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultadoPage(resposta: _respostas),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz App - Resposta Textual',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Pergunta Atual
            Text(
              _perguntas[_perguntaAtual],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            /// Formulário
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _perguntaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite sua resposta',
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Digite sua resposta' : null,
              ),
            ),

            const SizedBox(height: 24),

            /// Botão
            Align(
              alignment: Alignment.centerLeft,
              child: CustomButton(
                onPressed: _submitForm,
                text: 'Próximo',
              ),
            ),
          ],
        ),
      ),
    );
  }
}


