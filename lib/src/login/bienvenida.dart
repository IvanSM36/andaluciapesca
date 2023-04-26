// ignore_for_file: use_build_context_synchronously

import 'package:andaluciapesca/src/cuenta/menu_navegacion.dart';
import 'package:andaluciapesca/src/utils/LoginGoogleUtils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:andaluciapesca/src/login/iniciar_sesion_email.dart';
import 'package:andaluciapesca/src/login/registrate.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Bienvenida extends StatelessWidget {
  Bienvenida({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andalucia Pesca',
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
                    onPressed: () {
                      LoginGoogleUtils().signInWithGoogle().then((user) {
                        // Comprobamos si se a iniciadp sesion o no
                        if (user != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Bienvenida();
                              },
                            ),
                          ); // Si se a iniciado sesion correctamente nos redirige a la pantalla menunav
                        } else {
                          // Si falla nos mostrara una ventana de alerta con el mensajer de error
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
                      });
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
                      Navigator.pushNamed(context, '/entrarEmail');
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
                      Navigator.pushNamed(context, '/registrate');
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
