import 'package:flutter/material.dart';

class Registrate extends StatelessWidget {
  const Registrate({super.key});

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
                const SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 250,
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
