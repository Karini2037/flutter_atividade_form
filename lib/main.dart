import 'package:flutter/material.dart';
import 'componentes/pagina1.dart';
import 'componentes/pagina2.dart';

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
      home: const QuizScreen(), // Define a tela inicial do app
      debugShowCheckedModeBanner: false,
    );
  }
}

