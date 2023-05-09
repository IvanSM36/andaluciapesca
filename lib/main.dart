import 'package:andaluciapesca/screens/bienvenida.dart';
import 'package:andaluciapesca/screens/cuenta/clubs_competicion.dart';
import 'package:andaluciapesca/screens/iniciar_sesion_email.dart';
import 'package:andaluciapesca/screens/registrate.dart';
import 'package:andaluciapesca/screens/cuenta/guardar_zona.dart';
import 'package:andaluciapesca/screens/cuenta/informacion.dart';
import 'package:andaluciapesca/screens/cuenta/perfil_usuario.dart';
import 'package:andaluciapesca/screens/cuenta/subir_captura.dart';
import 'package:andaluciapesca/screens/cuenta/menu_navegacion.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_options.dart';

void main() async {
  // Inicializa Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andalucia Pesca',
      debugShowCheckedModeBanner: false, // Oculta la etiqueta Debug del Appbar
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Bienvenida(),
      routes: {
        '/bienvenida': (context) => Bienvenida(),
        '/entrarEmail': (context) => const IniciarSesionEmail(),
        '/registrate': (context) => const Registrate(),
        '/menuNav': (context) => const MenuNav(),
        '/clubCompeticion': (context) => const ClubsCompeticion(),
        '/informacion': (context) => const Informacion(),
        '/perfilUsuario': (context) => const PerfilUsuario(),
        '/subirCaptura': (context) => const SubirCaptura(),
        '/guardarZona': (context) => const GuardarZona(),
      },
    );
  }
}
