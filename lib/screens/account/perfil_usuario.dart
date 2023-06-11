// ignore_for_file: use_build_context_synchronously

import 'package:andaluciapesca/models/Usuario.dart';
import 'package:andaluciapesca/screens/login/bienvenida.dart';
import 'package:andaluciapesca/services/login_google_service.dart';
import 'package:andaluciapesca/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mapbox_gl/mapbox_gl.dart';

const positionMap = LatLng(37.376796, -5.986858);

class PerfilUsuario extends StatefulWidget {
  const PerfilUsuario({super.key});

  @override
  State<PerfilUsuario> createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  late MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  String email = "";
  String nombreUsuario = "";
  String nombre = "";
  String apellidos = "";
  String telefono = "";
  String fotoPerfil = "";
  List galeria = [];

  String? emailShared;
  String? nombreUsuarioShared;
  String? nombreShared;
  String? apellidosShared;
  String? telefonoShared;
  String? fotoPerfilShared;

  ////////// METODOS  //////////

  // Metodo para obtener los datos de un usuario
  void _saveDataUsuario() async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await db.collection('usuarios').doc(user?.email).get();

    final Usuario usuario = Usuario.fromFirestore(snapshot, null);

    email = usuario.email!;
    nombreUsuario = usuario.nombreUsuario!;
    nombre = usuario.nombre!;
    apellidos = usuario.apellidos!;
    telefono = usuario.telefono!;
    fotoPerfil = usuario.fotoPerfil!;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("email", email);
    await prefs.setString("nombreUsuario", nombreUsuario);
    await prefs.setString("nombre", nombre);
    await prefs.setString("apellidos", apellidos);
    await prefs.setString("telefono", telefono);
    await prefs.setString("fotoPerfil", fotoPerfil);

    emailShared = await loadDataUsuario('email');
    nombreUsuarioShared = await loadDataUsuario('nombreUsuario');
    nombreShared = await loadDataUsuario('nombre');
    apellidosShared = await loadDataUsuario('apellidos');
    telefonoShared = await loadDataUsuario('telefono');
    fotoPerfilShared = await loadDataUsuario('fotoPerfil');

    await _cargarValorAlmacenado();
  }

  // Metodo que obtiene los datos del usuario del sharedPreference
  Future<String?> loadDataUsuario(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // Metodo que carga los datos del sharedPreference y los almacena en una variable
  Future<void> _cargarValorAlmacenado() async {
    String? emailShared = await loadDataUsuario('email');
    String? nombreUsuarioShared = await loadDataUsuario('nombreUsuario');
    String? nombreShared = await loadDataUsuario('nombre');
    String? apellidosShared = await loadDataUsuario('apellidos');
    String? telefonoShared = await loadDataUsuario('telefono');
    String? fotoPerfilShared = await loadDataUsuario('fotoPerfil');

    print("EmailShared " + "$emailShared");
    print("email antes de añadir shared " + email);

    setState(() {
      email = emailShared!;
      nombreUsuario = nombreUsuarioShared!;
      nombre = nombreShared!;
      apellidos = apellidosShared!;
      telefono = telefonoShared!;
      fotoPerfil = fotoPerfilShared!;
    });
    print("email despues de añadir shared " + email);
  }

  // Metodo quye limpia los valores del sharedPreferences
  void _removeData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    setState(() {
      email = emailShared ?? "";
      nombreUsuario = nombreUsuarioShared ?? "";
      nombre = nombreShared ?? "";
      apellidos = apellidosShared ?? "";
      telefono = telefonoShared ?? "";
      fotoPerfil = fotoPerfilShared ?? "";
    });
    print("EmailShared despues de limpiar " + "$emailShared");
    print("email despues de limpiar " + email);
  }

  // Metodo para obtener la galeria de fotos
  Future<void> _getGaleriaFotos() async {
    // Obtengo el usuario
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await db.collection('usuarios').doc(user?.email).get();
    final Usuario usuario = Usuario.fromFirestore(snapshot, null);

    galeria = usuario.galeria!;
  }

  ////////// FIN METODOS //////////

  @override
  void initState() {
    super.initState();
    _saveDataUsuario();
    _getGaleriaFotos();
  }

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
                    onTap: () {
                      _removeData();
                      LoginGoogleUtils().signOutGoogle();
                      FirebaseAuth.instance.signOut();

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
                  Column(
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
                                              Color.fromARGB(255, 68, 105, 63),
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
                                          ////////// FOTO PREFIL //////////
                                          child: Center(
                                            child: CircleAvatar(
                                              radius: 80,
                                              backgroundImage:
                                                  NetworkImage("$fotoPerfil"),
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
                                    ////////// NOMBRE DE USUARIO //////////
                                    Text(
                                      "$nombreUsuario",
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

                      //////// Menu TabBar ///////
                      SizedBox(
                        height: 600,
                        child: DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              TabBar(
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 61, 75, 59),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.7),
                                      blurRadius: 5,
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
                                    Column(
                                      children: [
                                        ////////// BOTON SUBIR CAPTURAS /////////
                                        Container(
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: const Offset(0,
                                                    4), // changes position of shadow
                                              ),
                                            ],
                                          ),

                                          // Boton
                                          child: ElevatedButton(
                                            // Evento para el boton
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, "/subirCaptura");
                                            },

                                            // Diseño del boton
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 61, 75, 59),
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
                                        ////////// CAPTURAS //////////
                                        //.builder se utiliza cuando el número de elementos no es fijo
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 20),
                                          child: GridView.builder(
                                            // physics: const NeverScrollableScrollPhysics(), // Desactiva el scroll del propio GridView
                                            shrinkWrap: true,
                                            itemCount: galeria.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  3, // Número de columnas
                                              mainAxisSpacing:
                                                  2.0, // Espacio vertical entre elementos
                                              crossAxisSpacing:
                                                  2.0, // Espacio horizontal entre elementos
                                            ),

                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Image.network(
                                                  galeria[index],
                                                  fit: BoxFit.cover);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),

                                    ////// ZONAS //////
                                    Column(
                                      children: [
                                        ////////// BOTON SUBIR ZONA /////////
                                        /*Container(
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: const Offset(0,
                                                    4), // changes position of shadow
                                              ),
                                            ],
                                          ),

                                          // Boton
                                          child: ElevatedButton(
                                            // Evento para el boton
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, "/subirZona");
                                            },

                                            // Diseño del boton
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 61, 75, 59),
                                              minimumSize:
                                                  const Size(300, 45),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20), // Hacer los bordes más redondos con un radio de 20 píxeles
                                              ),
                                              fixedSize: const Size(300, 45),
                                            ),

                                            // Fila para la imagen y el texto del boton
                                            child: const Text(
                                              "Subir zona",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),*/
                                        ////////// ZONAS //////////
                                        //.builder se utiliza cuando el número de elementos no es fijo

                                        Center(
                                          child: Container(
                                            height: 492,
                                            width: 600,
                                            margin:
                                                const EdgeInsets.only(top: 20),
                                            child: MapboxMap(
                                              accessToken:
                                                  'sk.eyJ1IjoiaXZhbnNtMjAiLCJhIjoiY2xpOGh5aDUxMWNraTNla2J3Z3lhMDQzdCJ9.ocMmh6nrCoW_isWMjheENw',
                                              styleString:
                                                  'mapbox://styles/ivansm20/cli67fq6r02k801r000n8daa8',
                                              onMapCreated: _onMapCreated,
                                              initialCameraPosition:
                                                  const CameraPosition(
                                                target: positionMap,
                                                zoom: 5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ///// Equipo /////
                                    Column(
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                  spreadRadius: 2,
                                                  blurRadius: 5,
                                                  offset: const Offset(0,
                                                      4), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            // Boton
                                            child: ElevatedButton(
                                              // Evento para el boton
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, "/subirEquipo");
                                              },

                                              // Diseño del boton
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 61, 75, 59),
                                                minimumSize:
                                                    const Size(300, 45),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20), // Hacer los bordes más redondos con un radio de 20 píxeles
                                                ),
                                                fixedSize: const Size(300, 45),
                                              ),

                                              // Fila para la imagen y el texto del boton
                                              child: const Text(
                                                "Subir equipo",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 20),
                                          child: GridView.builder(
                                            // physics: const NeverScrollableScrollPhysics(), // Desactiva el scroll del propio GridView
                                            shrinkWrap: true,
                                            itemCount: galeria.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  3, // Número de columnas
                                              mainAxisSpacing:
                                                  2.0, // Espacio vertical entre elementos
                                              crossAxisSpacing:
                                                  2.0, // Espacio horizontal entre elementos
                                            ),

                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Image.network(
                                                  galeria[index],
                                                  fit: BoxFit.cover);
                                            },
                                          ),
                                        ),
                                      ],
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
