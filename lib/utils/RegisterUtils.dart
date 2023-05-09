// ignore_for_file: use_build_context_synchronously

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterUtils {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late BuildContext
      context; // Variable de instancia para almacenar el BuildContext

  RegisterUtils(BuildContext context) {
    this.context = context; // Asignar el contexto al variable de instancia
  }

  // Metodo future que registra una cuenta con email y contraseña (Future )
  Future<void> signUp(String email, String password) async {
    bool emailVerification = false;

    try {
      // Registrar al usuario con Firebase Auth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Aquí puedes realizar acciones adicionales después de registrar al usuario

      // Envio un mensaje de verificacion
      sendEmailVerification();
      //Lo vuelvo true para controlar con un if que se ha enviado el email y muestre un mensaje
      emailVerification = true;
      if (emailVerification) {
        //Muestro un mensaje avisando del envio de email
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Registrandote'),
            content: const Text(
                'Se ha enviado un correo electronico de confirmacion. ¡Revisa span!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cerrar'),
              ),
            ],
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('La contraseña proporcionada es demasiado débil.');

        // Capturo el error de email existente y muestro un toast indicandolo
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "El Email introducido ya existe",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == 'invalid-email') {
        Fluttertoast.showToast(
            msg: "El formato del Email introducido no es valido.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      // Muestro el error por consola
      print(e);
    }
  }

  Future<void> sendEmailVerification() async {
    User? user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  // Agrega nombre de usuario nombre y apellido a la base de datos
  /* Future<void> addUser(String username, String name, String apellido) async {
    try {
      await _firestore.collection('usuarios').add({
        'username': username,
        'nombre': name,
        'apellido': apellido,
      });
      print('Usuario agregado con éxito');
    } catch (e) {
      print('Error al agregar usuario: $e');
    }
  }*/
}
