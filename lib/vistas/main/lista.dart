import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as prefix0;
import 'botonFlotanteMain.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as _cloud;
import '../../funciones/dataGeter.dart' as _dataGet;
import 'package:cached_network_image/cached_network_image.dart' as _cache;
import 'mainGlobal.dart' as _mainGlobal;

class ListaRest extends StatefulWidget {
  const ListaRest();
  @override
  State<StatefulWidget> createState() {
    return ListaRestState();
  }
}

class ListaRestState extends State<ListaRest> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _cloud.Firestore.instance.collection('restaurantes').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Text("Cargando...");
        else {
          return ListView.builder(
              itemExtent: 150.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return _buildRestauranteItem(
                    context, snapshot.data.documents[index]);
              });
        }
      },
    );
  }

  Widget _buildRestauranteItem(context, res) {
    return Container(
      alignment: Alignment.topRight,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 6,
          offset:
              Offset.lerp(Offset.fromDirection(0), Offset.fromDirection(6), 0),
        ),
      ], color: Colors.white),
      margin: EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container( 
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //nombre
                Text(
                  res['nombre'],
                  style: TextStyle(fontSize: 21.0, fontFamily: 'Stylish'),
                ),
                //descripcion
                Text(
                  res['descripcion'],
                ),
                Text('puntuacion: ${res['puntuacion']}'),
              ],
            ),
          ),

          //Imagen
          FutureBuilder<String>(
            future: _dataGet.imagePath(res['imagen']),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _cache.CachedNetworkImage(
                  imageUrl: snapshot.data,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            alignment: FractionalOffset.topCenter,
                            image: imageProvider),
                      ),
                    );
                  },
                  fit: BoxFit.fitHeight,
                  useOldImageOnUrlChange: true,
                  placeholder: (context, string) => CircularProgressIndicator(),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
