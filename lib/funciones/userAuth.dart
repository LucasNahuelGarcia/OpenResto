import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../datosGlobales.dart' as datos;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<bool> cerrarSesion() async {
  try{
    _auth.signOut();
    datos.usuario = null;
    print('Sesión cerrada correctamente');
    return true;
  }catch(e){
    print('Error cerrando sesión: $e');
    return false;
  }
}

Future<bool> intentarLogIn(String email, String passwrd) async {
  FirebaseUser user;
  try {
    //intentar iniciar sesion
    user =
        await _auth.signInWithEmailAndPassword(password: passwrd, email: email);
    print("ingresando con usuario $email");
  } catch (e) {
    //si hay un error, devolver falso
    datos.usuario = null;
    print(e);
    return false;
  }
  //si se inicio sesion sin errores devolver verdadero y asignar el usuario
  datos.usuario = user;
  return true;
}
Future<bool> registrarUsuario(String email, String passwd, String nombre) async {
  FirebaseUser user;
  try {
    user = await _auth.createUserWithEmailAndPassword(password: passwd, email: email);

    UserUpdateInfo userUpdateInfo =UserUpdateInfo();
    userUpdateInfo.displayName = nombre;

    user.updateProfile(userUpdateInfo);
  } catch (e) {
    print(e);
    return false;
  }

    datos.usuario = user;
    return true;
}