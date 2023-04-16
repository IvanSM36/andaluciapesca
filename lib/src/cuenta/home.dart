import 'package:andaluciapesca/src/providers/stories_provider.dart';
import 'package:flutter/material.dart';

import '../models/stories_model.dart';

int _currentIndex = 0; // Inicializando _currentIndex a 0

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Instanciamos objeto stories
  StoriesProvider storiesProvider = StoriesProvider();

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
          title: const Text('Andalucia pesca'),
        ),
        body: _contenedorHistorias(),
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
          if (index == 0) {
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

// Funcion que diseña el contenedor donde van las Historias
  Widget _contenedorHistorias() {
    StoriesProvider storiesProvider = StoriesProvider();
    return Container(
      height: 105,
      width: double.infinity, // Ocupa el 100% de la pantalla a lo ancho
      margin: const EdgeInsets.only(
          top: 10, left: 5), // Le damos un margin a las historias
      child: ListView(
        scrollDirection:
            Axis.horizontal, // Hace la lista y el scroll Horizontal
        shrinkWrap: true, // Se adapta al contenido
        children: storiesProvider.getStories().map((storie) {
          return _historia(storie);
        }).toList(),
      ),
    );
  }

  Widget _historia(Storie storie) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                width: 3,
                color: const Color.fromARGB(255, 9, 112, 16),
              )),
          child: Container(
            padding: const EdgeInsets.all(1),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                image: NetworkImage(storie.imagen),
                height: 65,
                width: 65,
                fit: BoxFit.cover, // Se ajuste al contenedor
              ),
            ),
          ),
        ),
        Text(
          storie.nombre,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
