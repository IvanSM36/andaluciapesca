import 'package:andaluciapesca/src/cuenta/menu_navegacion.dart';
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
    final myController = TextEditingController();

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
                const SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 150,
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(60.0),
                  child: Form(
                    child: Column(
                      children: [
                        ///// Campo E-mail /////
                        TextFormField(
                          controller: emailController,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255,
                                      255)), // Establecer el color deseado
                            ),
                            labelText: 'Correo electrónico',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        /////  Campo contraseña /////
                        TextFormField(
                          controller: passwordController,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255,
                                  255)), // Establece el color del texto introducido
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors
                                    .white), // Establece el color del texto del label
                          ),
                          obscureText:
                              true, // Convierte en puntos la contraseña
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
                            onPressed: () async {
                              try {
                                final credential = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text);

                                FirebaseAuth.instance
                                    .authStateChanges()
                                    .listen((User? user) {
                                  if (user != null) {
                                    // El usuario inició sesión con éxito
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const MenuNav(),
                                      ),
                                    );
                                  }
                                });
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  // El inicio de sesión falló
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                          'Error de inicio de sesión'),
                                      content: const Text(
                                          'No existe una cuenta con ese Email.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                } else if (e.code == 'wrong-password') {
                                  // El inicio de sesión falló
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                          'Error de inicio de sesión'),
                                      content:
                                          const Text('Contraseña incorrecta'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }
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
                                    "Iniciar sesion",
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
