import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                  Navigator.pushNamed(context, "VistaRegistrarseUserMail");
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

class FormRegistrarseUserMail extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final FocusNode focusEmail = FocusNode();
  final FocusNode focusUsuario = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          TextField(
            //nombre de usuario
            controller: userController,
            focusNode: focusUsuario,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            onSubmitted: (text) {
              FocusScope.of(context).requestFocus(focusEmail);
            },
            decoration: InputDecoration(
              hintText: "nombre",
              prefixIcon: Icon(
                Icons.person,
              ),
            ),
          ),
          TextField(
            //email
            controller: emailController,
            focusNode: focusEmail,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.emailAddress,
            onSubmitted: (text) {
              _siguiente(context);
            },
            decoration: InputDecoration(
              hintText: "email",
              prefixIcon: Icon(
                Icons.email,
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
                    //Boton Siguiente
                    child: Text(
                      "Siguiente",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    onPressed: () {
                      _siguiente(context);
                    }),
                RaisedButton(
                  //Boton Google
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
    );
  }

  ///Funciones ------------------------------------
  bool _verificarCampos() {
    if (emailController.text != "" && userController.text != "") {
      return true;
    } else {
      Fluttertoast.showToast(
        msg: "Ambos campos son obligatorios",
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.black,
        backgroundColor: Colors.yellow[300],
      );
      return false;
    }
  }

  void _siguiente(context) {
    if (_verificarCampos()) {
      userAuth.protoUsuario.nombre = userController.text;
      userAuth.protoUsuario.email = emailController.text;

      Navigator.pushNamed(context, "VistaRegistrarsePass");
    }
  }
}

class FormRegistrarsePass extends StatelessWidget {
  final TextEditingController passController = TextEditingController();
  final TextEditingController passConfController = TextEditingController();

  final FocusNode focusPass = FocusNode();
  final FocusNode focusPassConf = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          TextField(
            //Contraseña
            controller: passController,
            focusNode: focusPass,
            textInputAction: TextInputAction.next,
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
            //Confirmar contraseña
            controller: passConfController,
            focusNode: focusPassConf,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.emailAddress,
            onSubmitted: (text) {
              focusPassConf.unfocus();
              _registrarse(context);
            },
            decoration: InputDecoration(
              hintText: "verificar",
              prefixIcon: Icon(
                Icons.verified_user,
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
                    //Boton Siguiente
                    child: Text(
                      "Siguiente",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    onPressed: () {
                      _registrarse(context);
                    }),
                RaisedButton(
                  //Boton Google
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
    );
  }

  ///Funciones ------------------------------------
  bool _verificarCampos() {
    if (passController.text != "" && passConfController.text != "") {
      if (passController.text != passConfController.text) {
        Fluttertoast.showToast(
          msg: "Las contraseñas no coinciden",
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.black,
          backgroundColor: Colors.yellow[300],
        );
        return false;
      } else {
        return true;
      }
    } else {
      Fluttertoast.showToast(
        msg: "Ambos campos son obligatorios",
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.black,
        backgroundColor: Colors.yellow[300],
      );
      return false;
    }
  }

  void _registrarse(context) async {
    if (_verificarCampos()) {
      userAuth.protoUsuario.password = passController.text;

      if (await userAuth.registrarUsuario(userAuth.protoUsuario.email,
          userAuth.protoUsuario.password, userAuth.protoUsuario.nombre)) {
        //si se creo el usuario sin errores
          //Navigator.popUntil(context, ModalRoute.withName("VistaLogIn"));
      }

      Navigator.popAndPushNamed(context, "VistaRegistrarsePass");
    }
  }
}