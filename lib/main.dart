import 'package:andaluciapesca/src/cuenta/Clubs_Competicion.dart';
import 'package:andaluciapesca/src/cuenta/guardar_zona.dart';
import 'package:andaluciapesca/src/cuenta/informacion.dart';
import 'package:andaluciapesca/src/cuenta/perfil_usuario.dart';
import 'package:andaluciapesca/src/cuenta/subir_captura.dart';
import 'package:andaluciapesca/src/login/iniciar_sesion_email.dart';
import 'package:andaluciapesca/src/login/registrate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:andaluciapesca/src/cuenta/menu_navegacion.dart';
import 'package:andaluciapesca/src/login/bienvenida.dart';

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
      debugShowCheckedModeBanner:
          false, // Oculta la etiqueta Debug del Appbar feed_rounded
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => const MenuNav(),
        '/bienvenida': (context) => Bienvenida(),
        '/entrarEmail': (context) => const IniciarSesionEmail(),
        '/registrate': (context) => const Registrate(),
        '/clubCompeticion': (context) => const ClubsCompeticion(),
        '/informacion': (context) => const Informacion(),
        '/perfilUsuario': (context) => const PerfilUsuario(),
        '/subirCaptura': (context) => const SubirCaptura(),
        '/guardarZona': (context) => const GuardarZona(),
      },
    );
  }
}
