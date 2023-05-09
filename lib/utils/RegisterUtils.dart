import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterUtils {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late BuildContext
      context; // Variable de instancia para almacenar el BuildContext

  RegisterUtils(BuildContext context) {
    this.context = context; // Asignar el contexto al variable de instancia
  }

  Future<void> signUp(String email, String password) async {
    try {
      // Registrar al usuario con Firebase Auth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Aquí puedes realizar acciones adicionales después de registrar al usuario
      AlertDialog(
        title: Text('Registrandote'),
        content: const Text(
            'Se ha enviado un correo electronico de confirmacion. ¡Revisa span!'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cerrar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
      // Envio un mensaje de verificacion
      sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('La contraseña proporcionada es demasiado débil.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "El Email introducido ya existe",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendEmailVerification() async {
    User? user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }
}
