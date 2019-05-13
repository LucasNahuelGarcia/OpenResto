import 'package:flutter/material.dart';
import 'package:toast/toast.dart' as _toast;
import '../../funciones/userAuth.dart' as _auth;

String _nombre;
String _email;
String _pass;

class FormRegistrarse extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateFormRegsitrarse();
}

class StateFormRegsitrarse extends State<FormRegistrarse> {
  final _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            //Nombre
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "Nombre",
                prefixIcon: Icon(
                  Icons.person,
                ),
              ),
              onSaved: (text) => _nombre = text,
              validator: (text) => text.isNotEmpty ? null : 'Nombre requerido',
            ),
            //Email
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "email",
                prefixIcon: Icon(
                  Icons.mail,
                ),
              ),
              onSaved: (text) => _email = text,
              validator: (text) =>
                  _validarEmail(text) ? null : 'Email invalido',
            ),
            //Contraseña
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "contraseña",
                prefixIcon: Icon(
                  Icons.lock,
                ),
              ),
              obscureText: true,
              onSaved: (text) => _pass = text,
              validator: (text) => _validarPass(text)
                  ? null
                  : 'debe tener al menos 6 caracteres',
            ),
            //Confirmar contraseña
            TextFormField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "verificar",
                prefixIcon: Icon(
                  Icons.verified_user,
                ),
              ),
              obscureText: true,
              validator: (text) =>
                  _validarPassVer(text) ? null : 'las contraseñas no coinciden',
            ),

            //botones
            Container(
              padding: EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //Boton Siguiente
                  RaisedButton(
                      child: Text(
                        "Registrarse",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      onPressed: () {
                        _registrarse(context);
                      }),
                  //Boton Google
                  RaisedButton(
                    color: Colors.white,
                    child: Text(
                      "Ingresar con Google",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {},
                    splashColor: Colors.white,
                    highlightColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///Funciones ------------------------------------

  bool _validarEmail(String email) {
    if (email.contains('@') && email.contains('.'))
      return true;
    else
      return false;
  }

  bool _validarPass(String pass) {
    if (pass.length >= 6)
      return true;
    else
      return false;
  }

  bool _validarPassVer(String pass) {
    final FormState form = _formKey.currentState;
    form.save();
    if (pass != _pass)
      return false;
    else
      return true;
  }

  void _registrarse(context) async {
    final FormState form = _formKey.currentState;

    if (!form.validate())
      return _toast.Toast.show('Campos con errores', context,
          duration: 5, backgroundColor: Colors.yellow[700], gravity: 2);

    form.save();//para poder obtener el valor de pass y compararlo con passval
    
    //se intenta registrar el usuario
    if (await _auth.registrarUsuario(_email, _pass, _nombre)) {
      if (await _auth.intentarLogIn(_email, _pass)) {
        //una vez creado el usuario se intenta loguearse con el mismo
        print('Se inicio sesión con el usuario registrado');
        Navigator.pushReplacementNamed(context, 'VistaMain');
      } else {
        print('Error con el usuario creado');
        Navigator.pushReplacementNamed(context, 'VistaLogIn');
      }
    }
  }
}
