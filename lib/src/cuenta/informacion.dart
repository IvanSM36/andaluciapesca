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
        ),
        bottomNavigationBar: _menuNavegacion(context),
      ),
    );
  }

  Widget _menuNavegacion(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        showUnselectedLabels: false, // No muestra el label de los demas items
        showSelectedLabels: false, // No muestra el label del item seleccionado
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 165, 204, 158),
        unselectedItemColor: Colors.white,
        iconSize: 28, // tamaño de los iconos
        backgroundColor: const Color.fromARGB(255, 61, 75, 59),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });

          // Si ya estás en la página de Perfil de usuario, no haga nada.
          if (index == 2) {
            return;
          }

          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/clubCompeticion');
              break;
            case 2:
              Navigator.pushNamed(context, '/informacion');
              break;
            case 3:
              Navigator.pushNamed(context, '/perfilUsuario');
              break;
          }
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/trofeo.png'),
            ),
            label: "Clubs",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons
                  .article_rounded), //description_rounded  article_roundeddiscount_rounded
              label: "Info"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: "Perfil"),
        ],
      ),
    );
  }
}
