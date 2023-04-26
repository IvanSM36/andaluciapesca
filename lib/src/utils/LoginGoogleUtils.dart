import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
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

    // Objeto para traernos la autenticacion
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Objeto para obtener la credencial
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    // Objeto
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    // Recogemos el user y lo guardamos en un objeto user
    User? user = userCredential.user;

    return _isCurrentSignIn(user!);
  }

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
