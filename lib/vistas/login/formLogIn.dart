import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart' as _toast;
import '../../funciones/userAuth.dart' as _auth;

String _email;
String _pass;

class FormLogIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateFormLogIn();
  }
}

class StateFormLogIn extends State<FormLogIn> {
  final _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          //input Email
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.mail),
            ),
            onSaved: (val) => _email = val,
            validator: (val) => _validarEmail(val) ? null : 'Email invalido',
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          //input Contraseña
          TextFormField(
            decoration: InputDecoration(
              hintText: "Contraseña",
              prefixIcon: Icon(Icons.lock),
            ),
            onSaved: (val) => _pass = val,
          ),

          //botones
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //Boton Ingresar
                RaisedButton(
                  child: Text(
                    "Ingresar",
                  ),
                  onPressed: () => tryLogIn(context),
                ),

                //Boton Registrarse
                FlatButton(
                  child: Text(
                    "Registrarse",
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "VistaRegistrarseUserMail");
                  },
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///Funciones ---------------------------
  bool _validarEmail(String email) {
    if (email.contains('@') && email.contains('.'))
      return true;
    else
      return false;
  }

  void tryLogIn(BuildContext context) async {
    final FormState form = _formKey.currentState;

    if (!form.validate())
      return _toast.Toast.show('Campos con errores', context,
          duration: 5, backgroundColor: Colors.yellow[700], gravity: 2);

    form.save();
    bool logInAttempt = await _auth.intentarLogIn(_email, _pass);

    if (logInAttempt) {
      print("LogIn exitoso");
      Navigator.pushReplacementNamed(context, "VistaMain");
    } else
      _toast.Toast.show('Email o contraseña invalidos', context,
          duration: 5, backgroundColor: Colors.red[700], gravity: 2);
  }
}
