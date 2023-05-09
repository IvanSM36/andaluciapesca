import 'package:flutter/material.dart';

import 'package:andaluciapesca/utils/RegisterUtils.dart';

class Registrate extends StatefulWidget {
  const Registrate({super.key});

  @override
  State<Registrate> createState() => _RegistrateState();
}

class _RegistrateState extends State<Registrate> {
  final userController = TextEditingController();
  final nameController = TextEditingController();
  final apellidoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
              fit: BoxFit.cover,
            ),
          ),

          child: ListView(
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Titulo en el body
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
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(),
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: 150,
                        ),
                      ),

                      // Texto Registrate
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Registrate",
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

                            Image.asset(
                              "assets/images/registrar.png",
                              width: 25,
                              height: 25,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.all(30.0),
                        child: Form(
                          child: Column(
                            children: [
                              ///// Campo usuario /////
                              TextFormField(
                                controller: userController,
                                cursorColor:
                                    const Color.fromARGB(199, 141, 179, 136),
                                style: const TextStyle(
                                  // Color del texto cuando escribimos
                                  color: Colors.white,
                                ),
                                decoration: const InputDecoration(
                                  fillColor: Color.fromARGB(109, 0, 0, 0),
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  labelText: 'Usuario:',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              ///// Fila Nombre Apellido /////
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: TextFormField(
                                        controller: nameController,
                                        cursorColor: const Color.fromARGB(
                                            199, 141, 179, 136),
                                        style: const TextStyle(
                                          // Color del texto cuando escribimos
                                          color: Colors.white,
                                        ),
                                        decoration: const InputDecoration(
                                          fillColor:
                                              Color.fromARGB(109, 0, 0, 0),
                                          filled: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                          labelText: 'Nombre:',
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15.0),
                                    Expanded(
                                      child: TextFormField(
                                        controller: apellidoController,
                                        cursorColor: const Color.fromARGB(
                                            199, 141, 179, 136),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: const InputDecoration(
                                          fillColor:
                                              Color.fromARGB(109, 0, 0, 0),
                                          filled: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                          labelText: 'Apellidos:',
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              ///// Campo E-mail /////
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  controller: emailController,
                                  cursorColor:
                                      const Color.fromARGB(199, 141, 179, 136),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: const InputDecoration(
                                    fillColor: Color.fromARGB(109, 0, 0, 0),
                                    filled: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    suffixIcon: Icon(
                                      Icons.person,
                                      color: Color.fromARGB(199, 141, 179, 136),
                                    ), // Agrega un icono a la derecha
                                    labelText: 'Correo electrónico:',
                                    labelStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
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
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                    focusColor: Colors.white,
                                    // Agrega un icono a la derecha
                                    suffixIcon: Icon(
                                      Icons.lock,
                                      color: Color.fromARGB(199, 141, 179, 136),
                                    ),
                                    labelText: 'Contraseña:',
                                    labelStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colors
                                            .white), // Establece el color del texto del label
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
                                    RegisterUtils(context).signUp(
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
                                    "Registrarse",
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
                      )
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
