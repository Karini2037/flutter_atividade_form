import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz APP - Respostas Textuais',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const QuizScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class QuizScreen extends StatefulWidget {
 const QuizScreen({super.key});

  @override
    _QuizScreenState createState() => _QuizScreenState();    
}

class _QuizScreenState extends State<QuizScreen> {
final _formKey = GlobalKey<FormState>();

//controladores para os campos de entrada
final _perguntaController = TextEditingController();

//funçaõ validação do Quiz
void _submitForm(){
  if(_formKey.currentState?.validate() ?? false) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoPage(
          pergunta: _perguntaController.text
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Qual é a capital do Brasil?'),
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //campo
              TextFormField(
                controller: _perguntaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Sua resposta'
                ),
                //validação do campo
                validator:(value) {
                  if (value == null || value.isEmpty){
                    return 'Digite sua resposta';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // botão enviar
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Próximo'),
              ),
            ],
          ),
        ),
      ),
    );
}
}






//Página Resultado 2 contruir um arquivo

class ResultadoPage extends StatelessWidget {
  final String pergunta;

  //construtor da página, recebendo pergunta
  const ResultadoPage({super.key, required this.pergunta});

  void _submitForm(){
  if(_formKey.currentState?.validate() ?? false) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoPage(
          pergunta: _perguntaController.text
        ),
      ),
    );
  }
}

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Qual é a capital da Paraíba?'),
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //campo
              TextFormField(
                controller: _perguntaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Sua resposta'
                ),
                //validação do campo
                validator:(value) {
                  if (value == null || value.isEmpty){
                    return 'Digite sua resposta';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // botão enviar
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Próximo'),
              ),
            ],
          ),
        ),
      ),
    );
}
}
