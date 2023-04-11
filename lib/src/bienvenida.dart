import 'package:andaluciapesca/src/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:andaluciapesca/src/iniciar_sesion_email.dart';
import 'package:andaluciapesca/src/registrate.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Bienvenida extends StatelessWidget {
  Bienvenida({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andalucia Pesca',
      home: Scaffold(
        body: Container(
          // Fondo gif
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/FondoLogin.gif'),
                fit: BoxFit.cover),
          ),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Titulo
                Text(
                  "Andalucia Pesca",
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: const Offset(3.0, 3.0),
                        blurRadius: 6.0,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),

                // Imagen Logo
                const SizedBox(height: 60),
                Image.asset(
                  "assets/images/logo.png",
                  height: 250,
                ),

                //////////   Boton Entrar con Google  //////////
                const SizedBox(
                    height:
                        40), // Añadir un espacio en blanco entre la imagen y el boton

                // Contenedor para darle sombra
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 0.3,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  // Boton
                  child: ElevatedButton(
                    // Evento para el boton
                    onPressed: () async {
                      final GoogleSignInAccount? googleUser =
                          await googleSignIn.signIn();
                      final GoogleSignInAuthentication googleAuth =
                          await googleUser!.authentication;

                      final AuthCredential credential =
                          GoogleAuthProvider.credential(
                        accessToken: googleAuth.accessToken,
                        idToken: googleAuth.idToken,
                      );

                      final UserCredential userCredential =
                          await _auth.signInWithCredential(credential);
                      final User? user = userCredential.user;

                      if (user != null) {
                        // El usuario inició sesión con éxito
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      } else {
                        // El inicio de sesión falló
                        // ignore: use_build_context_synchronously
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Error de inicio de sesión'),
                            content: const Text(
                                'No se pudo iniciar sesión con Google. Por favor, intenta nuevamente.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },

                    //Diseño del boton
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(150, 255, 17, 0),
                      minimumSize: const Size(300, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Hacer los bordes más redondos con un radio de 20 píxeles
                      ),
                      fixedSize: const Size(300, 45),
                    ),

                    // Fila para la imagen y el texto del boton
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Espacio por la izquierda para la imagen
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Image.asset(
                            "assets/images/google.png",
                            width: 25,
                            height: 25,
                          ),
                        ),

                        // Hace que el widget Text ocupe el espacio restante para luego centrarlo
                        const Expanded(
                          child: Text(
                            "Entrar con Google",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //////////////////////////////////////

                //////////   Boton Entrar con E-mail   //////////
                const SizedBox(
                    height:
                        10), // Añadir un espacio en blanco entre la imagen y el boton
                // Contenedor para darle sombra
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 0.3,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  // Boton
                  child: ElevatedButton(
                    // Evento del boton
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const IniciarSesionEmail()));
                    },

                    // Diseño del boton
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(200, 61, 75, 59),
                        minimumSize:
                            const Size(0, 45), // Tamaño mínimo del botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Hacer los bordes más redondos con un radio de 20 píxeles
                        ),
                        fixedSize: const Size(300, 45)),

                    // Fila para la imagen y el texto del boton
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Espacio por la izquierda para la imagen
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Image.asset(
                            "assets/images/email.png",
                            width: 25,
                            height: 25,
                          ),
                        ),
                        // Hace que el widget Text ocupe el espacio restante para luego centrarlo
                        const Expanded(
                          child: Text(
                            "Entrar con E-mail",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //////////////////////////////////////

                //////////   Boton Registrate    //////////
                const SizedBox(height: 10), // Añadir un espacio en blanco
                // Contenedor para darle sombra
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 0.3,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  // Boton
                  child: ElevatedButton(
                    // Evento del boton
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Registrate()));
                    },
                    // Diseño del boton
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(200, 255, 255, 255),
                        minimumSize:
                            const Size(0, 45), // Tamaño mínimo del botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ), // Hacer los bordes más redondos con un radio de 20 píxeles
                        fixedSize: const Size(300, 45)),
                    // Fila para la imagen y el texto del boton
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Espacio por la izquierda para la imagen
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Image.asset(
                            "assets/images/registrar.png",
                            width: 25,
                            height: 25,
                          ),
                        ),
                        // Hace que el widget Text ocupe el espacio restante para luego centrarlo
                        const Expanded(
                          child: Text(
                            "Registrate",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 61, 75, 59),
                            ),
                          ),
                        ),
                      ],
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
