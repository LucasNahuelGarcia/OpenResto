import 'package:flutter/material.dart';
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
    return Stack(
      children: <Widget>[
        StreamBuilder(
          stream:
              _cloud.Firestore.instance.collection('restaurantes').snapshots(),
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
        ),
        FloatingLabelMain(
            alignment: Alignment.bottomLeft,
            iconData: Icons.map,
            onPressed: () => _mainGlobal.animarAPagina(0))
      ],
    );
  }

  Widget _buildRestauranteItem(context, res) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        alignment: Alignment.topRight,
        margin: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
            FutureBuilder<String>(
              future: _dataGet.imagePath(res['imagen']),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _cache.CachedNetworkImage(
                    imageUrl: snapshot.data,
                    imageBuilder: (context, imageProvider) {
                      return AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Image(
                          image: imageProvider,
                        ),
                      );
                    },
                    fit: BoxFit.fitHeight,
                    useOldImageOnUrlChange: true,
                    placeholder: (string, context) => Icon(
                          Icons.sentiment_neutral,
                          size: 100.0,
                        ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
