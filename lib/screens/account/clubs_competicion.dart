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
          child: //////// Menu TabBar ///////
              SizedBox(
            height: 700,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 61, 75, 59),
                      border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 161, 231, 150),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          blurRadius: 3,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20.0),
                    tabs: [
                      Tab(
                        child: Text(
                          "Clubs",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: const Offset(3.0, 3.0),
                                blurRadius: 6.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Competiciones",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: const Offset(3.0, 3.0),
                                blurRadius: 6.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // .count se utiliza cuando el número de elementos es fijo
                        GridView.count(
                          shrinkWrap: false,
                          crossAxisCount: 1, // Número de columnas
                          mainAxisSpacing:
                              0, // Espacio vertical entre elementos
                          crossAxisSpacing:
                              0, // Espacio horizontal entre elementos
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
                        GridView.count(
                          shrinkWrap: false,
                          crossAxisCount: 1, // Número de columnas
                          mainAxisSpacing:
                              0, // Espacio vertical entre elementos
                          crossAxisSpacing:
                              0, // Espacio horizontal entre elementos
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
