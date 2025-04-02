import 'package:flutter/material.dart';
import 'package:flutter_atividade_form/componentes/pagina2.dart';
import 'botao.dart';

class _QuizScreenState extends StatefulWidget{
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _formKey = GlobalKey<FormState>();
  final _perguntaController = TextEditingController();
  int _perguntaAtual = 0;//indice de pergunta atual

  //Lista de perguntas

  final List<String> _perguntas = [
    "Qual é a capital do Brasil?",
    "Qual é capital da Paraíba?",
    "Qual é a capital de São Paulo",
    "Qual é a capital  de Natal",
  ];

  //Lista de resposta fornecidas pelo usuário
  final List<String> _resposta = [];

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _resposta.add(_perguntaController.text); //salva a resposta
        _perguntaController.clear();//Limpa o input

        if (_perguntaAtual < _perguntas.length - 1) {
          _perguntaAtual++;// Avança~para próxima pergunta
        } else {
          //Se for para última pergunta, vai para tela de resultado
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultadoPage(resposta: _resposta),
            ),
          );
        }
      });
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text(_perguntas[_perguntaAtual])), //Mostrar a pergunta atual
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _perguntaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite sua resposta'
              ),
              validator: (value) => value == null || value.isEmpty ?  'Digite sua resposata' : null,
            ),
            const SizedBox(height: 16),
            CustomButton(onPressed: _submitForm, text: 'Proximo'),
          ],
        ),
      ),
  ),
  );
}
}