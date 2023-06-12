// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginEmailServices {
  // Variable de instancia para almacenar el BuildContext El BuildContext es la referencia al contexto en el que se encuentra un widget dentro de la interfaz de usuario.
  late BuildContext context;
  LoginEmailServices(this.context);

  // Metodo que inicia sesion con email
  Future<void> signInWithEmail(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Comprobamos si el email esta verificado activando la cuenta desde el correo que se envia anteriormente (el ! en user indica que user no va a estar vacio, que recibirá en un futuro un valor
      if (!credential.user!.emailVerified) {
        await FirebaseAuth.instance.signOut();
        Fluttertoast.showToast(
            msg: "Tienes que verificar tu cuenta antes de iniciar sesión.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Navigator.pushReplacementNamed(context, '/menuNav');
      }
    } on FirebaseAuthException catch (e) {
      // Controlo si el email no existe y muestro un toast
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "El Email introducido no existe",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        // Controlo si la contraseña es incorrecta y muestro un toast
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Contraseña incorrecta.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        // Controlo si el email no es valido y muestro un toast
      } else if (e.code == 'invalid-email') {
        Fluttertoast.showToast(
            msg: "El formato del Email introducido no es valido.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
}
