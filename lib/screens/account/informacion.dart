import 'package:flutter/material.dart';

int _currentIndex = 0; // Inicializando _currentIndex a 0

class Informacion extends StatefulWidget {
  const Informacion({super.key});

  @override
  State<Informacion> createState() => _Informacion();
}

class _Informacion extends State<Informacion> {
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
          title: const Text('Información'),
        ),
        body: Container(
          color: const Color.fromARGB(255, 131, 160, 126),
          child: GridView.count(
            shrinkWrap: false,
            crossAxisCount: 2, // Número de columnas
            mainAxisSpacing: 0, // Espacio vertical entre elementos
            crossAxisSpacing: 0, // Espacio horizontal entre elementos
            children: List.generate(6, (index) {
              // Generar una lista de elementos
              return Container(
                margin: const EdgeInsets.all(7),
                color: Colors.blue[100],
                child: Center(
                  child: Text(
                    "Elemento $index",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
