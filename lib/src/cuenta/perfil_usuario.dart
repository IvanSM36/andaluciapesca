import 'package:flutter/material.dart';

int _currentIndex = 0; // Inicializando _currentIndex a 0

class PerfilUsuario extends StatefulWidget {
  const PerfilUsuario({super.key});

  @override
  State<PerfilUsuario> createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andalucia app',
      debugShowCheckedModeBanner: false,
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
          title: const Text('Perfil de usuario'),
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  const PopupMenuItem(
                    child: Text('Editar perfil'),
                  ),
                  const PopupMenuItem(
                    child: Text('Cerrar sesión'),
                  ),
                  const PopupMenuItem(
                    child: Text('Borrar cuenta', style: TextStyle(color: Colors.red)),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              color: const Color.fromARGB(255, 131, 160, 126),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 165, 204, 158),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3.0,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
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
                        width: 170,
                        height: 170,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
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
                            child: CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(
                                  "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/980.jpg"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 70,
              right: 30,
              child: IconButton(
                icon: const Icon(Icons.message),
                iconSize: 50,
                color: Colors.white,
                onPressed: () {
                  // Acción que se ejecutará al presionar el icono de editar
                },
              ),
            ),
            Positioned(
              top: 70,
              left: 30,
              child: IconButton(
                icon: const Icon(Icons.notifications_sharp),
                iconSize: 50,
                color: Colors.white,
                onPressed: () {
                  // Acción que se ejecutará al presionar el icono de editar
                },
              ),
            ),
            Positioned(
              top: 200,
              left: 125,
              child: Text(
                "@IvanSM",
                style: TextStyle(
                  fontSize: 32,
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
      ),
    );
  }
}
