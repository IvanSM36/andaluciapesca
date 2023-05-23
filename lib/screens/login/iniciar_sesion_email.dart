import 'package:andaluciapesca/utils/LoginEmailUtils.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class IniciarSesionEmail extends StatefulWidget {
  const IniciarSesionEmail({super.key});

  @override
  State<IniciarSesionEmail> createState() => _IniciarSesionEmailState();
}

class _IniciarSesionEmailState extends State<IniciarSesionEmail> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 150,
                  ),
                ),

                // Texto Iniciar Sesion
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Iniciar Sesion",
                        style: TextStyle(
                          fontSize: 25,
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

                      // Para separar el  text con el icono
                      const SizedBox(
                        width: 15,
                      ),

                      const Icon(
                        Icons.login,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  ),
                ),

                // Formulario
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 40,
                    right: 40,
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        ///// Campo E-mail /////
                        TextFormField(
                          controller: emailController,
                          cursorColor: const Color.fromARGB(199, 141, 179, 136),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(109, 0, 0, 0),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            labelText: 'Correo electrónico:',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            suffixIcon: Icon(
                              Icons.email,
                              color: Color.fromARGB(199, 141, 179, 136),
                            ),
                          ),
                        ),

                        /////  Campo contraseña /////
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            controller: passwordController,
                            cursorColor:
                                const Color.fromARGB(199, 141, 179, 136),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255,
                                    255)), // Establece el color del texto introducido
                            decoration: const InputDecoration(
                              fillColor: Color.fromARGB(109, 0, 0, 0),
                              filled: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),

                              labelText: 'Contraseña:',
                              labelStyle:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              // Agrega un icono a la derecha
                              suffixIcon: Icon(
                                Icons.lock,
                                color: Color.fromARGB(199, 141, 179, 136),
                              ), // Establece el color del texto del label
                            ),
                            obscureText:
                                true, // Convierte en puntos la contraseña
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 0.3,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          // Boton
                          child: ElevatedButton(
                            // Evento del boton
                            onPressed: () {
                              LoginEmailUtils(context).signInWithEmail(
                                  emailController.text.trim(),
                                  passwordController.text.trim());
                            },

                            // Diseño del boton
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(200, 61, 75, 59),
                                minimumSize: const Size(
                                    0, 45), // Tamaño mínimo del botón
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20), // Hacer los bordes más redondos con un radio de 20 píxeles
                                ),
                                fixedSize: const Size(200, 45)),

                            child: const Text(
                              "Iniciar sesión",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        //////////////////////////////////////
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
