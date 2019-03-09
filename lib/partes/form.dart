import 'package:flutter/material.dart';
import '../funciones/userAuth.dart' as userAuth;
import 'mensajes.dart' as mensajes;

class FormLogIn extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPass = FocusNode();

  mensajes.MensajeError mensajeError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          //input Email
          focusNode: focusEmail,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onSubmitted: (term) {
            focusEmail.unfocus();
            FocusScope.of(context).requestFocus(focusPass);
          },
          controller: emailController,
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.mail),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
        ),
        TextField(
          //input Contraseña
          focusNode: focusPass,
          controller: passwordController,
          onSubmitted: (term) {
            focusPass.unfocus();
            tryLogIn(context);
          },
          decoration: InputDecoration(
            hintText: "Contraseña",
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        Container(
          //botones
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                  //Boton Ingresar
                  child: Text(
                    "Ingresar",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  onPressed: () {
                    tryLogIn(context);
                  }),
              FlatButton(
                //Boton Registrarse
                child: Text(
                  "Registrarse",
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onPressed: () => {},

                splashColor: Colors.white,
                highlightColor: Colors.white,
              ),
            ],
          ),
        ),
        mensajeError = mensajes.MensajeError()
      ],
    );
  }

  ///Funciones ---------------------------
  void tryLogIn(BuildContext context) async {
    bool logInAttempt =
        await userAuth.logIn(emailController.text, passwordController.text);
    if (logInAttempt) {
      mensajeError.state.toggleVer(false);
      Navigator.pushReplacementNamed(context, "VistaMain");
    } else {
      mensajeError.state.toggleVer(true);
    }
  }
}
