// ignore_for_file: use_build_context_synchronously

import 'package:andaluciapesca/services/login_google_service.dart';
import 'package:andaluciapesca/services/firebase_service.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Bienvenida extends StatelessWidget {
  Bienvenida({super.key});

  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta Debug del Appbar

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
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 200,
                  ),
                ),

                //////////   Boton Entrar con Google  //////////
                // Contenedor para darle sombra
                Container(
                  margin: const EdgeInsets.only(top: 40),
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
                      await LoginGoogleServices().signInWithGoogle().then(
                        (user) async {
                          // Comprobamos si se ha iniciado sesión
                          if (user != null) {
                            // Verificar si el usuario de Google ya existe
                            bool userExists = await LoginGoogleServices()
                                .checkUserExists(user);

                            if (userExists) {
                              // Si existe me redirige a la pantalla menu
                              Navigator.pushNamed(context, "/menuNav");
                            } else {
                              // Si no existe, navegamos a la pantalla menunav y creamos el usuario
                              FirebaseService().setUserDataGoogle();
                            }
                          } else {
                            // Si falla, mostramos una ventana de alerta con el mensaje de error
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
                      );
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

                //////////   Boton Entrar con E-mail   //////////

                // Contenedor para darle sombra
                Container(
                  margin: const EdgeInsets.only(top: 10),
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

                  ////////// BOTON //////////
                  child: ElevatedButton(
                    // Evento del boton
                    onPressed: () {
                      Navigator.pushNamed(context, '/entrarEmail');
                    },

                    ////////// Diseño del boton
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(200, 61, 75, 59),
                        // Tamaño mínimo del botón
                        minimumSize: const Size(0, 45),
                        shape: RoundedRectangleBorder(
                          // Hacer los bordes más redondos con un radio de 20 píxeles
                          borderRadius: BorderRadius.circular(20),
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

                //////////   Boton Registrate    //////////
                // Contenedor para darle sombra
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 0.3,
                        blurRadius: 10,
                        // changes position of shadow
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  // Boton
                  child: ElevatedButton(
                    // Evento del boton
                    onPressed: () {
                      Navigator.pushNamed(context, '/registrate');
                    },
                    // Diseño del boton
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(200, 255, 255, 255),
                        // Tamaño mínimo del botón
                        minimumSize: const Size(0, 45),
                        shape: RoundedRectangleBorder(
                          // Hacer los bordes más redondos con un radio de 20 píxeles
                          borderRadius: BorderRadius.circular(20),
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
