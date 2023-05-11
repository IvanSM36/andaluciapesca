import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginGoogleUtils {
  static const String TAG = "LoginGoogleUtils";
  // Controlar la autenticacion
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Funcionalidad de iniciar sesion con google
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Metodos Google
  // Iniciar sesion con google
  Future<User?> signInWithGoogle() async {
    log(TAG + ", signInWithGoogle() Init...");

    // Variable que recoge la cuenta de google que se a elegido para loguear.
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    log(TAG + ", signInWithGoogle() googleUser email -> ${googleUser?.email}");

    // Objeto donde recogemos la autenticación de Google
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Creamos las credenciales con el token de acceso y el token de ID de Google
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    // Iniciamos sesión en Firebase con las credenciales
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    // Obtenemos el usuario resultante
    User? user = userCredential.user;

    return _isCurrentSignIn(user!);
  }

  // Metodo que verifica si el usuario ha iniciado sesión correctamente
  Future<User?> _isCurrentSignIn(User user) async {
    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User? currentUser = _auth.currentUser;
      assert(user.uid == currentUser?.uid);

      log(TAG + ", signInWithGoogle() succeeded: $user");

      return user;
    }

    return null;
  }
  /////////////////////////////////////////////////////////////////////////////////////

  // Cerrar sesion de google
  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    log(TAG + ", Se ha cerrado sesion.");
  }
}
