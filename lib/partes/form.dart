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
                onPressed: () {
                  Navigator.pushNamed(context, "VistaRegistrarse");
                },

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
    mensajeError.state.toggleVer(false);
    bool camposLlenos = todosCamposLlenos();
    bool logInAttempt = await userAuth.intentarLogIn(
        emailController.text, passwordController.text);
    if (logInAttempt && camposLlenos) {
      Navigator.pushReplacementNamed(context, "VistaMain");
    } else {
      mensajeError.state.toggleVer(true);
    }
  }

  bool todosCamposLlenos() {
    if (emailController.text != "" && passwordController.text != "") {
      return true;
    }
    return false;
  }
}

class FormRegistrarse extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfController = TextEditingController();

  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPass = FocusNode();
  final FocusNode focusPassConf = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: emailController,
            focusNode: focusEmail,
            textInputAction: TextInputAction.continueAction,
            keyboardType: TextInputType.emailAddress,
            onSubmitted: (text) {
              focusEmail.unfocus();
              FocusScope.of(context).requestFocus(focusPass);
            },
            decoration: InputDecoration(
              hintText: "email",
              prefixIcon: Icon(
                Icons.email,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
          ),
          TextField(
            controller: passwordController,
            focusNode: focusPass,
            textInputAction: TextInputAction.continueAction,
            onSubmitted: (text) {
              focusPass.unfocus();
              FocusScope.of(context).requestFocus(focusPassConf);
            },
            decoration: InputDecoration(
              hintText: "contraseña",
              prefixIcon: Icon(
                Icons.lock,
              ),
            ),
          ),
          TextField(
            controller: passwordConfController,
            focusNode: focusPassConf,
            textInputAction: TextInputAction.done,
            onSubmitted: (text) {

            },
            decoration: InputDecoration(
              hintText: "confirmar contraseña",
              prefixIcon: Icon(
                Icons.lock,
              ),
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
                      "Registrarse",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    onPressed: () {}),
                RaisedButton(
                  //Boton Registrarse
                  color: Colors.white,

                  child: Text(
                    "Ingresar con Google",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "VistaRegistrarse");
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
}
