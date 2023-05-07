import 'package:andaluciapesca/screens/cuenta/clubs_competicion.dart';
import 'package:andaluciapesca/screens/cuenta/informacion.dart';
import 'package:andaluciapesca/screens/cuenta/perfil_usuario.dart';
import 'package:andaluciapesca/screens/cuenta/publicaciones.dart';
import 'package:flutter/material.dart';

class MenuNav extends StatefulWidget {
  const MenuNav({super.key});

  @override
  State<MenuNav> createState() => _MenuNavState();
}

class _MenuNavState extends State<MenuNav> {
  PageController pageController = PageController();

  //
  int selectedIndex = 0;

  //Lista con las pantallas
  List<Widget> pantallas = [
    const Publicaciones(),
    const ClubsCompeticion(),
    const Informacion(),
    const PerfilUsuario(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pantallas[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false, // Oculta el label de los demas items
        showSelectedLabels: false, // Oculta el label del item seleccionado
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 165, 204, 158),
        unselectedItemColor: Colors.white,
        iconSize: 28, // tamaño de los iconos
        backgroundColor: const Color.fromARGB(255, 61, 75, 59),
        onTap: onItemTapped,
        currentIndex: selectedIndex,

        items: const <BottomNavigationBarItem>[
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

  ///// METODOS /////
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
