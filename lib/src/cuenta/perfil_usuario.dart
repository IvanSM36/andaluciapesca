// ignore_for_file: use_build_context_synchronously

import 'package:andaluciapesca/src/login/bienvenida.dart';
import 'package:andaluciapesca/src/utils/LoginGoogleUtils.dart';
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        ///// APPBAR /////
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
                  PopupMenuItem(
                    child: const Text('Cerrar sesión'),
                    onTap: () async {
                      await LoginGoogleUtils().signOutGoogle();

                      Navigator.of(context, rootNavigator: true)
                          .pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Bienvenida();
                          },
                        ),
                        (_) => false,
                      );
                    },
                  ),
                  const PopupMenuItem(
                    child: Text('Borrar cuenta',
                        style: TextStyle(color: Colors.red)),
                  ),
                ];
              },
            ),
          ],
        ),

        ////////////////////////////////////////

        body: Stack(
          children: [
            /////////////////// BODY ////////////////////////
            Container(
              color: const Color.fromARGB(255, 131, 160, 126),
              child: Row(
                ///////////////// PESTAÑAS //////////////////////
                children: [Container()],

                ////////////////////////////////////////////////
              ),

              //////////////// GALERIA ///////////////////////

              ////////////////////////////////////////////////
            ),

            ///// CABECERA PERFIL /////
            Column(
              children: <Widget>[
                Container(
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.notifications_sharp),
                            iconSize: 40,
                            color: Colors.white,
                            onPressed: () {
                              // Acción que se ejecutará al presionar el icono
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
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
                          IconButton(
                            icon: const Icon(Icons.message),
                            iconSize: 40,
                            color: Colors.white,
                            onPressed: () {
                              // Acción que se ejecutará al presionar el icono
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
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
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.tiktok_outlined),
                              iconSize: 40,
                              color: Colors.white,
                              onPressed: () {
                                // Acción que se ejecutará al presionar el icono
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.facebook),
                              iconSize: 40,
                              color: Colors.white,
                              onPressed: () {
                                // Acción que se ejecutará al presionar el icono
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.telegram),
                              iconSize: 40,
                              color: Colors.white,
                              onPressed: () {
                                // Acción que se ejecutará al presionar el icono
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.telegram),
                              iconSize: 40,
                              color: Colors.white,
                              onPressed: () {
                                // Acción que se ejecutará al presionar el icono
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
