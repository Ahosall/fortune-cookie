import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Biscoito da Sorte",
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var fortuneCookieOpened = false;

  var fortunePhrases = [
    "Seu próximo bug será apenas um recurso disfarçado.",
    "O usuário nunca clica onde você espera… mas sempre clica.",
    "Um push hoje pode ser o rollback de amanhã.",
    "O pixel perfeito só existe até o cliente pedir ajuste.",
    "Seu código limpo de hoje é a dívida técnica de amanhã.",
    "A tela mais simples é sempre a mais difícil de aprovar.",
    "Quem não versiona, reprograma.",
    "O deploy sempre acontece minutos antes do café.",
    "Um bom design salva um app ruim; um código ruim derruba qualquer design.",
    "O commit perfeito é silencioso e sem conflitos.",
  ];

  var fortunePhrase = "";

  void brokenCookie() {
    var fortunePhrasePos = Random().nextInt(fortunePhrases.length);
    fortunePhrase = fortunePhrases[fortunePhrasePos];
    fortuneCookieOpened = !fortuneCookieOpened;
  }

  @override
  Widget build(BuildContext context) {
    var imgCookieFull = "images/biscoito_inteiro.png";
    var imgCookieBroken = "images/biscoito_quebrado.png";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Biscoito da Sorte", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      fortuneCookieOpened ? imgCookieBroken : imgCookieFull,
                    ),
                  ),
                  Text(
                    fortuneCookieOpened
                        ? fortunePhrase
                        : "Qual será a sua sorte de hoje?",
                    style: TextStyle(fontSize: 28, fontFamily: "Sue Ellen Francisco"),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    brokenCookie();
                  });
                },
                child: Text(
                  (fortuneCookieOpened
                          ? "Tentar novamente?"
                          : "Quebrar biscoito!")
                      .toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
