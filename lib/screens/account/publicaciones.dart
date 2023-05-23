import 'package:flutter/material.dart';

int _currentIndex = 0; // Inicializando _currentIndex a 0

class Publicaciones extends StatefulWidget {
  const Publicaciones({super.key});

  @override
  State<Publicaciones> createState() => _Informacion();
}

class _Informacion extends State<Publicaciones> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andalucia app',
      //debugShowCheckedModeBanner: false, // Oculta la etiqueta Debug del Appbar
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
          title: const Text('Andalucia Pesca'),
        ),
        body: Container(
          color: const Color.fromARGB(255, 131, 160, 126),
        ),
      ),
    );
  }
}
