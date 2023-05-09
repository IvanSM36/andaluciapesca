import 'package:flutter/material.dart';

int _currentIndex = 0; // Inicializando _currentIndex a 0

class ClubsCompeticion extends StatefulWidget {
  const ClubsCompeticion({super.key});

  @override
  State<ClubsCompeticion> createState() => _ClubsCompeticion();
}

class _ClubsCompeticion extends State<ClubsCompeticion> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andalucia app',
      debugShowCheckedModeBanner: false, // Oculta la etiqueta Debug del Appbar
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color.fromARGB(255, 61, 75, 59),
          elevation: 5,
          centerTitle: true,
          title: const Text('Clubs y Competiciones'),
        ),
        body: Container(
          color: const Color.fromARGB(255, 131, 160, 126),
        ),
      ),
    );
  }
}
