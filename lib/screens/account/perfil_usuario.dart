// ignore_for_file: use_build_context_synchronously

import 'package:andaluciapesca/providers/Usuario.dart';
import 'package:andaluciapesca/screens/login/bienvenida.dart';
import 'package:andaluciapesca/utils/LoginGoogleUtils.dart';
import 'package:andaluciapesca/utils/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilUsuario extends StatefulWidget {
  const PerfilUsuario({super.key});

  @override
  State<PerfilUsuario> createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  final List<String> images = [
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/981.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/982.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/983.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/984.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/912.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/936.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/987.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/954.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/975.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/990.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/991.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/941.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/947.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/911.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/921.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/671.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/341.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/241.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/291.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/453.jpg',
    'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/456.jpg',
  ];

  String email = "";
  String nombreUsuario = "";
  String nombre = "";
  String apellidos = "";
  String telefono = "";
  String fotoPerfil = "";

  @override
  void initState() {
    super.initState();
    cargarDatosShared();
  }

  // Metodo para obtener los datos de un usuario
  Future getUsuario() async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await db.collection('usuarios').doc(user?.email).get();

    final Usuario usuario = Usuario.fromFirestore(snapshot, null);
    email = usuario.email;
    nombreUsuario = usuario.nombreUsuario;
    nombre = usuario.nombre;
    apellidos = usuario.apellidos;
    telefono = usuario.telefono;
    fotoPerfil = usuario.fotoPerfil;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("email", email);
      prefs.setString("nombreUsuario", nombreUsuario);
      prefs.setString("nombre", nombre);
      prefs.setString("apellidos", apellidos);
      prefs.setString("telefono", telefono);
      prefs.setString("fotoPerfil", fotoPerfil);
    });
  }

  cargarDatosShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//prueba
    setState(() {
      email = prefs.getString("email")!;
      nombreUsuario = prefs.getString("nombreUsuario")!;
      nombre = prefs.getString("nombre")!;
      apellidos = prefs.getString("apellidos")!;
      fotoPerfil = prefs.getString("fotoPerfil")!;
    });

    print(email);
  }

  // SharedPreferences preferences =
  //                         await SharedPreferences.getInstance();
  //                     await preferences.clear();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
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
                      LoginGoogleUtils().signOutGoogle();
                      FirebaseAuth.instance.signOut();

                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      await preferences.clear();

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

        body: Container(
          color: const Color.fromARGB(255, 131, 160, 126),
          child: ListView(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        ///// CABECERA PERFIL /////
                        Row(
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
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        IconButton(
                                          icon: const Icon(
                                              Icons.notifications_sharp),
                                          iconSize: 40,
                                          color: Colors.white,
                                          onPressed: () {
                                            // Acción que se ejecutará al presionar el icono
                                          },
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(255, 41, 46, 40),
                                                Color.fromARGB(
                                                    255, 68, 105, 63),
                                                Color.fromARGB(
                                                    255, 113, 168, 105),
                                                Color.fromARGB(
                                                    255, 158, 224, 147),
                                                Color.fromARGB(
                                                    255, 161, 231, 150),
                                                Color.fromARGB(
                                                    255, 166, 241, 154),
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
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  spreadRadius: 3.0,
                                                  blurRadius: 3,
                                                  offset: const Offset(0, 4),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: CircleAvatar(
                                                radius: 80,
                                                backgroundImage:
                                                    NetworkImage(""),
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
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        nombreUsuario,
                                        style: TextStyle(
                                          fontSize: 32,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              offset: const Offset(3.0, 3.0),
                                              blurRadius: 6.0,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon:
                                              const Icon(Icons.tiktok_outlined),
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

                        //////// Menu TabBar ///////
                        SizedBox(
                          height: 600,
                          child: DefaultTabController(
                            length: 3,
                            child: Column(
                              children: [
                                TabBar(
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color:
                                        const Color.fromARGB(255, 61, 75, 59),
                                    border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          255, 161, 231, 150),
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
                                        "Capturas",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              offset: const Offset(3.0, 3.0),
                                              blurRadius: 6.0,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "Zonas",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              offset: const Offset(3.0, 3.0),
                                              blurRadius: 6.0,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "Equipo",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              offset: const Offset(3.0, 3.0),
                                              blurRadius: 6.0,
                                              color:
                                                  Colors.black.withOpacity(0.5),
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
                                      //.builder se utiliza cuando el número de elementos no es fijo
                                      GridView.builder(
                                        // physics: const NeverScrollableScrollPhysics(), // Desactiva el scroll del propio GridView
                                        shrinkWrap: true,
                                        itemCount: images.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              3, // Número de columnas
                                          mainAxisSpacing:
                                              2.0, // Espacio vertical entre elementos
                                          crossAxisSpacing:
                                              2.0, // Espacio horizontal entre elementos
                                        ),

                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Image.network(images[index],
                                              fit: BoxFit.cover);
                                        },
                                      ),
                                      // .count se utiliza cuando el número de elementos es fijo
                                      GridView.count(
                                        crossAxisCount: 3,
                                        children: List.generate(
                                          6,
                                          (index) => Center(
                                            child: Text(
                                              'Zona $index',
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GridView.count(
                                        crossAxisCount: 3,
                                        children: List.generate(
                                          6,
                                          (index) => Center(
                                            child: Text(
                                              'Equipo $index',
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        ////////// BOTON FLOTANTE ///////////
        floatingActionButton: Container(
          width: 200,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 0.5,
                blurRadius: 10,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          // Boton
          child: ElevatedButton(
            // Evento para el boton
            onPressed: () {
              Navigator.pushNamed(context, "/subirCaptura");
            },

            // Diseño del boton
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 61, 75, 59),
              minimumSize: const Size(300, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    20), // Hacer los bordes más redondos con un radio de 20 píxeles
              ),
              fixedSize: const Size(300, 45),
            ),

            // Fila para la imagen y el texto del boton
            child: const Text(
              "Subir captura",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
