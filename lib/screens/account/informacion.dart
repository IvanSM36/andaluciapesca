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
      // debugShowCheckedModeBanner: false, // Oculta la etiqueta Debug del Appbar
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

        ///// BODY /////
        body: Container(
          color: const Color.fromARGB(255, 131, 160, 126),
          child: Center(
            child: GridView.count(
              shrinkWrap: false,
              crossAxisCount: 2, // Número de columnas
              mainAxisSpacing: 0, // Espacio vertical entre elementos
              crossAxisSpacing: 0, // Espacio horizontal entre elementos
              children: [
                //// Noticias
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/noticias');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 41, 46, 40),
                          Color.fromARGB(255, 68, 105, 63),
                          Color.fromARGB(255, 113, 168, 105),
                          Color.fromARGB(255, 158, 224, 147),
                          Color.fromARGB(255, 161, 231, 150),
                          Color.fromARGB(255, 166, 241, 154),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 3.0,
                                blurRadius: 3,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Image(
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/andaluciapesca-cbda7.appspot.com/o/AndaluciaPesca%2FImagenes%2FRestringido.jpg?alt=media&token=fe309ff0-fb31-46a1-89b2-18f607e25a4a"),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(215, 0, 0, 0),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          margin: const EdgeInsets.only(top: 130),
                          child: const Center(
                            child: Text(
                              "Noticias",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ///// Normativa
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/normativa');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(7),
                    color: Colors.blue[100],
                    child: const Center(
                      child: Text(
                        "Normativa",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),

                ///// Zonas Restringidas
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/zonasRestringidas');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(7),
                    color: Colors.blue[100],
                    child: const Center(
                      child: Text(
                        "Zonas restringidas",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),

                ///// Zonas Permitidas
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/zonasPermitidas');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(7),
                    color: Colors.blue[100],
                    child: const Center(
                      child: Text(
                        "Zonas permitidas",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),

                ///// Especies Prohibidas
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/especiesProhibidas');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(7),
                    color: Colors.blue[100],
                    child: const Center(
                      child: Text(
                        "Especies prohibidas",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),

                ///// Especies Permitidas
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/especiesPermitidas');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(7),
                    color: Colors.blue[100],
                    child: const Center(
                      child: Text(
                        "Especies permitidas",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
