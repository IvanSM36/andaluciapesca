import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginEmailUtils {
  late BuildContext
      context; // Variable de instancia para almacenar el BuildContext

  LoginEmailUtils(BuildContext context) {
    this.context = context; // Asignar el contexto al variable de instancia
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // Comprobar si el inicio de sesión fue exitoso
      if (FirebaseAuth.instance.currentUser != null) {
        print('Inicio de sesión exitoso.');
        Navigator.pushReplacementNamed(context, '/menuNav');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No existe una cuenta con ese Email.');
      } else if (e.code == 'wrong-password') {
        print('Contraseña incorrecta.');
      }
    }
  }
}
