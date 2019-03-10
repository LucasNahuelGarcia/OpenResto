import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../datosGlobales.dart' as datos;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<bool> intentarLogIn(String email, String passwrd) async {
  FirebaseUser user;
  try {
    //intentar iniciar sesion
    user =
        await _auth.signInWithEmailAndPassword(password: passwrd, email: email);
    print("ingresando con usuario $email");
  } catch (e) {
    datos.usuario = null;
    print(e);
    return false;
  }

  datos.usuario = user;
  return true;
}
