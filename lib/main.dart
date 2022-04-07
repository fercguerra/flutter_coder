import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0; 
  //moveu para State a própria variável
  var _pontuacaoTotal = 0;
  final _perguntas = const [
      {
        'texto': 'Qual sua cor favorita?',
        'respostas': [
          {'texto': 'Preto', 'nota': 10 }, 
          {'texto': 'Vermelho', 'nota': 5},
          {'texto': 'Verde', 'nota': 3}, 
          {'texto': 'Branco', 'nota': 1},
        ],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': [
          {'texto': 'Coelho', 'nota': 10}, 
          {'texto': 'Cobra', 'nota': 5 }, 
          {'texto': 'Elefante', 'nota': 3},
          {'texto': 'Leão', 'nota': 1},
      ]},
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'respostas': [
          {'texto': 'Maria', 'nota': 10 },
          {'texto':'João', 'nota': 5 },
          {'texto':'Leo','nota': 3},
          {'texto':'Pedro', 'nota': 1 },
          ],
      }
    ];
  void _responder(int pontuacao) {
    //moveu o método
    if(temPerguntaSelecionada){
      setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }
}
void _reiniciarQuestionario() {
  setState(() {
    _perguntaSelecionada = 0;
    _pontuacaoTotal = 0;
     print(_pontuacaoTotal);
  });
}

bool get temPerguntaSelecionada {
  return _perguntaSelecionada < _perguntas.length;
 
}

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
        ? Questionario(
          perguntas: _perguntas, 
          perguntaSelecionada: _perguntaSelecionada, 
          responder: _responder,
          )              
        : Resultado(_pontuacaoTotal,  _reiniciarQuestionario),
   
      )
    );       
  }
}
