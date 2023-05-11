import 'package:andaluciapesca/screens/account/especies_permitidas.dart';
import 'package:andaluciapesca/screens/account/especies_prohibidas.dart';
import 'package:andaluciapesca/screens/account/normativa.dart';
import 'package:andaluciapesca/screens/account/zonas_permitidas.dart';
import 'package:andaluciapesca/screens/account/zonas_restringidas.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_options.dart';

import 'package:andaluciapesca/screens/login/bienvenida.dart';
import 'package:andaluciapesca/screens/login/iniciar_sesion_email.dart';
import 'package:andaluciapesca/screens/login/registrate.dart';
import 'package:andaluciapesca/screens/account/guardar_zona.dart';
import 'package:andaluciapesca/screens/account/informacion.dart';
import 'package:andaluciapesca/screens/account/perfil_usuario.dart';
import 'package:andaluciapesca/screens/account/subir_captura.dart';
import 'package:andaluciapesca/screens/account/menu_navegacion.dart';
import 'package:andaluciapesca/screens/account/clubs_competicion.dart';
import 'package:andaluciapesca/screens/account/noticias.dart';

void main() async {
  // Inicializa Firebase
  WidgetsFlutterBinding.ensureInitialized(); // inicializa Flutter

  //Se queda en espera y inicializa Firebase.
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
        '/noticias': (context) => const Noticia(),
        '/normativa': (context) => const Normativa(),
        '/zonasRestringidas': (context) => const ZonasRestringidas(),
        '/zonasPermitidas': (context) => const ZonasPermitidas(),
        '/especiesProhibidas': (context) => const EspeciesProhibidas(),
        '/especiesPermitidas': (context) => const EspeciesPermitidas(),
      },
    );
  }
}
